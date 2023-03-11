
{{ config(materialized='view') }}

with invoice_items as (

    SELECT 
        "InvoiceLineId" AS InvoiceLineId, "InvoiceId" AS InvoiceId, "TrackId" AS TrackId, 
        "UnitPrice" AS UnitPrice, "Quantity" AS Quantity
    FROM  {{ source('majmoud', 'invoice_items') }}

),

invoices as (

    SELECT 
        "InvoiceId" AS InvoiceId, "CustomerId" AS CustomerId, "InvoiceDate" AS InvoiceDate, 
        "BillingAddress" AS BillingAddress, "BillingCity" AS BillingCity, 
        "BillingState" AS BillingState, "BillingCountry" AS BillingCountry, 
        "BillingPostalCode" AS BillingPostalCode, "Total" AS Total
    FROM  {{ source('majmoud', 'invoices') }}
)
SELECT
    invoice_items.InvoiceLineId, invoice_items.InvoiceId, invoice_items.TrackId, 
    invoice_items.UnitPrice, invoice_items.Quantity,
    invoices.CustomerId, invoices.InvoiceDate, invoices.BillingAddress, invoices.BillingCity, 
    invoices.BillingState, invoices.BillingCountry, invoices.BillingPostalCode, invoices.Total
FROM  invoices
RIGHT JOIN invoice_items  
ON invoices.InvoiceId = invoice_items.InvoiceId