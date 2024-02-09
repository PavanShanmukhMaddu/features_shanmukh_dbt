--The total quantity should be more than zero
--Otherwise it will be negative
 
select *
  from {{ ref('day_invoice') }}  
 where total_quantity < 0