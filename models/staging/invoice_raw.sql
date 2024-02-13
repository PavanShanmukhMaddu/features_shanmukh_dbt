with source_raw as (
 
    select * from {{ source('source_raw', 'invoice_raw') }}
 
),
 
invoice_raw as (
 
    select
 
        customer_nbr,
        product_nbr as product_id,
        transaction_timestamp,
        creation_date,
        region,
        zone,
        quantity,
        {{ dbt_utils.generate_surrogate_key(['customer_nbr', 'product_id', 'transaction_timestamp']) }} as hashkey
 
    from source_raw
 
)
 
select * from invoice_raw