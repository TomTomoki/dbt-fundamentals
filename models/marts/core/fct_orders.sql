with payments as (
    select
        *
    from {{ ref('stg_payments')}}
),
orders as (
    select
        *
    from {{ ref('stg_orders')}}
),
final as (
    select
        o.customer_id
        , o.order_id
        , sum(p.amount) as amount
    from orders o
    join payments p
        on o.order_id = p.order_id
    group by o.customer_id, o.order_id
)
select * from final