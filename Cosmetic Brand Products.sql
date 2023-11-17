Select *
from [dbo].[CosmeticBrandProducts] As CosmeticBrandProducts

ALTER TABLE CosmeticBrandProducts
DROP COLUMN imagelink , productlink ,websitelink,description,productapiurl,apifeaturedimage,productcolors,currency,pricesign,taglist;

SELECT 
SUBSTRING(createdat,1,CHARINDEX ('-',createdat)+2) as createddate
from CosmeticBrandProducts

Alter Table CosmeticBrandProducts
Add createddate nvarchar(255);

Update CosmeticBrandProducts
SET createddate = Substring (createdat,1,CHARINDEX ('-',createdat)+2)

ALTER TABLE CosmeticBrandProducts
DROP COLUMN createdat

SELECT 
SUBSTRING(updatedat,1,CHARINDEX ('-',updatedat)+2) as updateddate
from CosmeticBrandProducts

Alter Table CosmeticBrandProducts
Add updateddate nvarchar(255);

Update CosmeticBrandProducts
SET updateddate = Substring (updatedat,1,CHARINDEX ('-',updatedat)+2)

ALTER TABLE CosmeticBrandProducts
DROP COLUMN updatedat

Select Top 5 brand, max(price) as maxpricebrand
From CosmeticBrandProducts
Where price is not Null
group by brand
order by maxpricebrand DESC

Select Top 5 name , max(price) as maxpricename
From CosmeticBrandProducts
Where price is not Null
group by name
order by maxpricename DESC

Select Top 10 brand, avg(convert(float,rating)) as avgbrandrating
From CosmeticBrandProducts
Where brand is not Null
group by brand
order by avgbrandrating DESC

Select Top 10 category, 
Count (category) As CategoryCount,
Count(*)*100/Sum (count(*))Over() As categoryPercent
From  CosmeticBrandProducts
Group by category
Order By categoryCount Desc

Select Top 5 producttype, 
Count (producttype) As producttypeCount,
Count(*)*100/Sum (count(*))Over() As producttypePercent
From  CosmeticBrandProducts
Group by producttype
Order By producttypeCount DESC

