--View dataset

SELECT * 
FROM WorldData

--The Country column is the unique id for the dataset, therefore it must be checked for duplicates

SELECT Country                                                                                                                                                                           
FROM WorldData 
WHERE Country IS NULL;

--No duplicates

-- Rename columns, remove the unnecessary characters

EXEC sp_rename 'WorldData.[Density_(P/Km2)]', 'Density (P/Km2)', 'COLUMN';

EXEC sp_rename 'WorldData."Agricultural Land( %)"', 'Agricultural Land', 'COLUMN';

EXEC sp_rename 'WorldData."Armed_Forces_Size"', 'Armed Forces Size', 'COLUMN';

EXEC sp_rename 'WorldData."Capital/Major City"', 'Capital / Major City', 'COLUMN';

EXEC sp_rename 'WorldData."CPI Change (%)"', 'CPI Change', 'COLUMN';

EXEC sp_rename 'WorldData."Forested Area (%)"', 'Forested Area', 'COLUMN';

EXEC sp_rename 'WorldData."Gross primary education enrollment (%)"', 'Gross Primary Education Enrollment', 'COLUMN';

EXEC sp_rename 'WorldData."Gross tertiary education enrollment (%)"', 'Gross Tertiary Education Enrollment', 'COLUMN';

EXEC sp_rename 'WorldData."Infant mortality"', 'Infant Mortality', 'COLUMN';

EXEC sp_rename 'WorldData."Largest city"', 'Largest City', 'COLUMN';

EXEC sp_rename 'WorldData."Life expectancy"', 'Life Expectancy', 'COLUMN';

EXEC sp_rename 'WorldData."Maternal mortality ratio"', 'Maternal Mortality Ratio', 'COLUMN';

EXEC sp_rename 'WorldData."Official language"', 'Official Language', 'COLUMN';

EXEC sp_rename 'WorldData."Out of pocket health expenditure"', 'Out of Pocket Health Expenditure', 'COLUMN';

EXEC sp_rename 'WorldData."Population: Labor force participation (%)"', 'Population: Labor Force Participation', 'COLUMN';

EXEC sp_rename 'WorldData."Tax revenue (%)"', 'Tax Revenue', 'COLUMN';

EXEC sp_rename 'WorldData."Total tax rate"', 'Total Tax Rate', 'COLUMN';

EXEC sp_rename 'WorldData."Unemployment rate"', 'Unemployment Rate', 'COLUMN';

EXEC sp_rename 'WorldData."Urban_population"', 'Urban Population', 'COLUMN';



--Check null values across columns

SELECT 
    COUNT([Density (P/Km2)]) AS NullDensity,
    COUNT(Abbreviation) AS NullAbbreviation,
    COUNT([Agricultural Land]) AS NullAgriculturalLand,
    COUNT([Land Area(Km2)]) AS NullLandArea
FROM WorldData
WHERE [Density (P/Km2)] IS NULL
   OR Abbreviation IS NULL
   OR [Agricultural Land] IS NULL
   OR [Land Area(Km2)] IS NULL;

   SELECT 
    SUM(CASE WHEN [Density (P/Km2)] IS NULL THEN 1 ELSE 0 END) AS Null_Density,
    SUM(CASE WHEN Abbreviation IS NULL THEN 1 ELSE 0 END) AS Null_Abbreviation,
    SUM(CASE WHEN [Agricultural Land] IS NULL THEN 1 ELSE 0 END) AS Null_Agricultural_Land,
    SUM(CASE WHEN [Land Area(Km2)] IS NULL THEN 1 ELSE 0 END) AS Null_Land_Area,
    SUM(CASE WHEN [Armed Forces Size] IS NULL THEN 1 ELSE 0 END) AS Null_Armed_Forces_Size,
    SUM(CASE WHEN [Birth Rate] IS NULL THEN 1 ELSE 0 END) AS Null_Birth_Rate,
    SUM(CASE WHEN [Calling Code] IS NULL THEN 1 ELSE 0 END) AS Null_Calling_Code,
    SUM(CASE WHEN [Capital / Major City] IS NULL THEN 1 ELSE 0 END) AS Null_Capital_Major_City,
    SUM(CASE WHEN [Co2-Emissions] IS NULL THEN 1 ELSE 0 END) AS Null_Co2_Emissions,
    SUM(CASE WHEN CPI IS NULL THEN 1 ELSE 0 END) AS Null_CPI,
    SUM(CASE WHEN [CPI Change] IS NULL THEN 1 ELSE 0 END) AS Null_CPI_Change,
    SUM(CASE WHEN [Currency-Code] IS NULL THEN 1 ELSE 0 END) AS Null_Currency_Code,
    SUM(CASE WHEN [Fertility Rate] IS NULL THEN 1 ELSE 0 END) AS Null_Fertility_Rate,
    SUM(CASE WHEN [Forested Area] IS NULL THEN 1 ELSE 0 END) AS Null_Forested_Area,
    SUM(CASE WHEN [Gasoline Price] IS NULL THEN 1 ELSE 0 END) AS Null_Gasoline_Price,
    SUM(CASE WHEN GDP IS NULL THEN 1 ELSE 0 END) AS Null_GDP,
    SUM(CASE WHEN [Gross Primary Education Enrollment] IS NULL THEN 1 ELSE 0 END) AS Null_Gross_Primary_Education_Enrollment,
    SUM(CASE WHEN [Gross Tertiary Education Enrollment] IS NULL THEN 1 ELSE 0 END) AS Null_Gross_Tertiary_Education_Enrollment,
    SUM(CASE WHEN [Infant Mortality] IS NULL THEN 1 ELSE 0 END) AS Null_Infant_Mortality,
    SUM(CASE WHEN [Largest City] IS NULL THEN 1 ELSE 0 END) AS Null_Largest_City,
    SUM(CASE WHEN [Life Expectancy] IS NULL THEN 1 ELSE 0 END) AS Null_Life_Expectancy,
    SUM(CASE WHEN [Maternal Mortality Ratio] IS NULL THEN 1 ELSE 0 END) AS Null_Maternal_Mortality_Ratio,
    SUM(CASE WHEN [Minimum Wage] IS NULL THEN 1 ELSE 0 END) AS Null_Minimum_Wage,
    SUM(CASE WHEN [Official Language] IS NULL THEN 1 ELSE 0 END) AS Null_Official_Language,
    SUM(CASE WHEN [Out of Pocket Health Expenditure] IS NULL THEN 1 ELSE 0 END) AS Null_Out_of_Pocket_Health_Expenditure,
    SUM(CASE WHEN [Physicians Per Thousand] IS NULL THEN 1 ELSE 0 END) AS Null_Physicians_Per_Thousand,
    SUM(CASE WHEN [Population] IS NULL THEN 1 ELSE 0 END) AS Null_Population,
    SUM(CASE WHEN [Population: Labor Force Participation] IS NULL THEN 1 ELSE 0 END) AS Null_Population_Labor_Force_Participation,
    SUM(CASE WHEN [Tax Revenue] IS NULL THEN 1 ELSE 0 END) AS Null_Tax_Revenue,
    SUM(CASE WHEN [Total Tax Rate] IS NULL THEN 1 ELSE 0 END) AS Null_Total_Tax_Rate,
    SUM(CASE WHEN [Unemployment Rate] IS NULL THEN 1 ELSE 0 END) AS Null_Unemployment_Rate,
    SUM(CASE WHEN [Urban Population] IS NULL THEN 1 ELSE 0 END) AS Null_Urban_Population,
    SUM(CASE WHEN [Latitude] IS NULL THEN 1 ELSE 0 END) AS Null_Latitude,
    SUM(CASE WHEN [Longitude] IS NULL THEN 1 ELSE 0 END) AS Null_Longitude
FROM WorldData;



-- Find the missing Abbreviation and their corespondent Country

SELECT Country, Abbreviation 
FROM WorldData
WHERE Abbreviation IS NULL;


--Replace the missing abbreviation with the coresspondent one based on the Country column

UPDATE WorldData
SET Abbreviation = 'SZ'
WHERE Abbreviation IS NULL AND Country='Eswatini';

UPDATE WorldData
SET Abbreviation = 'CG'
WHERE Abbreviation IS NULL AND Country='Republic of the Congo';

UPDATE WorldData
SET Abbreviation = 'VC'
WHERE Abbreviation IS NULL AND Country='Vatican City';

UPDATE WorldData
SET Abbreviation = 'ROI'
WHERE Abbreviation IS NULL AND Country='Republic of Ireland';

UPDATE WorldData
SET Abbreviation = 'NM'
WHERE Abbreviation IS NULL AND Country='Namibia';

UPDATE WorldData
SET Abbreviation = 'MKD'
WHERE Abbreviation IS NULL AND Country='North Macedonia';

UPDATE WorldData
SET Abbreviation = 'PNA'
WHERE Abbreviation IS NULL AND Country='Palestinian National Authority';


-- Find the missing Agricultural Land and their corespondent Country

SELECT Country, [Agricultural Land] 
FROM WorldData
WHERE [Agricultural Land] IS NULL;


-- Impute missing values with 0

UPDATE WorldData
SET [Agricultural Land] = 0
WHERE [Agricultural Land] IS NULL;


-- Find the missing Land Area(Km2) and their corespondent Country

SELECT Country, [Land Area(Km2)]
FROM WorldData
WHERE [Land Area(Km2)] IS NULL;


-- Delete the missing values where Land Area(Km2) IS NULL

DELETE FROM WorldData
WHERE [Land Area(Km2)] IS NULL;


---- Find the missing Armed Forces Size and their corespondent Country

SELECT Country, [Armed Forces Size]
FROM WorldData
WHERE [Armed Forces Size] IS NULL;


-- Impute missing values with 0

UPDATE WorldData
SET [Armed Forces Size] = 0
WHERE [Armed Forces Size] IS NULL;

-- Find the missing Birth Rate and their corespondent Country

SELECT Country, [Birth Rate]
FROM WorldData
WHERE [Birth Rate] IS NULL;


-- Delete the missing values where Land Area(Km2) IS NULL

DELETE FROM WorldData
WHERE [Birth Rate] IS NULL;

-- Find the missing Birth Rate and their corespondent Country

SELECT Country, [Calling Code]
FROM WorldData
WHERE [Calling Code] IS NULL;

-- No values missing on Calling Code column


DELETE FROM WorldData
WHERE [Abbreviation] = 'ST';


-- Find Missing Values for Capital / Major City

SELECT Country, [Capital / Major City]
FROM WorldData
WHERE [Capital / Major City] IS NULL;

--Libya and Singapore, there are countries without information about Capital / Major City
-- Search on Google and add the Capital / Major City

UPDATE WorldData
SET [Capital / Major City] = 'Tripoli'
WHERE Country = 'Libya';

UPDATE WorldData
SET [Capital / Major City] = 'Singapore'
WHERE Country = 'Singapore';


-- Find Missing Values for Co2-Emissions

SELECT Country, [Co2-Emissions]
FROM WorldData
WHERE [Co2-Emissions] IS NULL;


-- Impute missing values with the mean value of the "Co2-Emissions" 

UPDATE WorldData
SET [Co2-Emissions] = (SELECT AVG([Co2-Emissions]) FROM WorldData)
WHERE [Co2-Emissions] IS NULL;


-- Find Missing Values for CPI

SELECT Country, [CPI]
FROM WorldData
WHERE [CPI] IS NULL;

-- Impute with the mean values to replace the null values

UPDATE WorldData
SET CPI = (SELECT AVG(CPI) FROM WorldData)
WHERE CPI IS NULL;



-- Find Missing Values for CPI Change

SELECT Country, [CPI Change]
FROM WorldData
WHERE [CPI Change] IS NULL;

-- Impute with the mean values to replace the null values

UPDATE WorldData
SET [CPI Change] = (SELECT AVG([CPI Change]) FROM WorldData)
WHERE [CPI Change] IS NULL;


-- Find Missing Values for Currency-Code

SELECT Country, [Currency-Code]
FROM WorldData
WHERE [Currency-Code] IS NULL;


-- Fill the missing values with the specific Currency-Code for each Country

UPDATE WorldData
SET [Currency-Code] = 'BSN'
WHERE [Country] = 'The Bahamas';

UPDATE WorldData
SET [Currency-Code] = 'BTN'
WHERE [Country] = 'Bhutan';

UPDATE WorldData
SET [Currency-Code] = 'KHR'
WHERE [Country] = 'Cambodia';

UPDATE WorldData
SET [Currency-Code] = 'Franc CFA'
WHERE [Country] = 'Central African Republic';

UPDATE WorldData
SET [Currency-Code] = 'USD'
WHERE [Country] = 'El Salvador';

UPDATE WorldData
SET [Currency-Code] = 'SZL'
WHERE [Country] = 'Eswatini';

UPDATE WorldData
SET [Currency-Code] = 'JPY'
WHERE [Country] = 'Japan';

UPDATE WorldData
SET [Currency-Code] = 'LSL'
WHERE [Country] = 'Lesotho';

UPDATE WorldData
SET [Currency-Code] = 'LSD'
WHERE [Country] = 'Liberia';

UPDATE WorldData
SET [Currency-Code] = 'MVR'
WHERE [Country] = 'Maldives';

UPDATE WorldData
SET [Currency-Code] = 'NAD'
WHERE [Country] = 'Namibia';

UPDATE WorldData
SET [Currency-Code] = 'EUR'
WHERE [Country] = 'Netherlands';

UPDATE WorldData
SET [Currency-Code] = 'PAB'
WHERE [Country] = 'Panama';

UPDATE WorldData
SET [Currency-Code] = 'ZWL'
WHERE [Country] = 'Zimbabwe';

-- Find Missing Values for Fertility Rate

SELECT Country, [Fertility Rate]
FROM WorldData
WHERE [Fertility Rate] IS NULL;


-- Remove rows with missing values, because many other information from other columns are missing

DELETE FROM WorldData
WHERE [Fertility Rate] IS NULL;


-- Find Missing Values for Forested Area

SELECT Country, [Forested Area]
FROM WorldData
WHERE [Forested Area] IS NULL;


--Impute missing information with a specific value

UPDATE WorldData
SET [Forested Area] = 0.00
WHERE [Country] = 'South Sudan';


-- Find Missing Values for Gasoline Price

SELECT Country, [Gasoline Price]
FROM WorldData
WHERE [Gasoline Price] IS NULL;

--Impute missing information with a specific value

UPDATE WorldData
SET [Gasoline Price] = 0.00
WHERE [Gasoline Price] IS NULL;


-- Find Missing Values for GDP

SELECT Country, [GDP]
FROM WorldData
WHERE [GDP] IS NULL;

-- No Missing Values


-- Find Missing Values for Gross Primary Education Enrollment 

SELECT Country, [Gross Primary Education Enrollment]
FROM WorldData
WHERE [Gross Primary Education Enrollment] IS NULL;


-- Impute with the Mean Value

UPDATE WorldData
SET [Gross Primary Education Enrollment] = (SELECT AVG([Gross Primary Education Enrollment]) FROM WorldData)
WHERE [Gross Primary Education Enrollment] IS NULL;


-- Find Missing Values for Gross Tertiary Education Enrollment 

SELECT Country, [Gross Tertiary Education Enrollment]
FROM WorldData
WHERE [Gross Tertiary Education Enrollment] IS NULL;


-- Impute with the Mean Value

UPDATE WorldData
SET [Gross Tertiary Education Enrollment] = (SELECT AVG([Gross Tertiary Education Enrollment]) FROM WorldData)
WHERE [Gross Tertiary Education Enrollment] IS NULL;


-- Find Missing Values for Infant mortality 

SELECT Country, [Infant Mortality]
FROM WorldData
WHERE [Infant Mortality] IS NULL;


-- Impute with the Mean Value

UPDATE WorldData
SET [Infant Mortality] = (SELECT AVG([Infant Mortality]) FROM WorldData)
WHERE [Infant Mortality] IS NULL;



-- Find Missing Values for Largest City

SELECT Country, [Largest City]
FROM WorldData
WHERE [Largest City] IS NULL;


-- Impute with a specific value
-- search on Google for the largest city in Brundei, Libya, Singapore

--Impute missing information with a specific value

UPDATE WorldData
SET [Largest City] = 'Bandar Seri Begawan'
WHERE [Country] = 'Brunei';

UPDATE WorldData
SET [Largest City] = 'Tripoli'
WHERE [Country] = 'Libya';

UPDATE WorldData
SET [Largest City] = 'Singapore'
WHERE [Country] = 'Singapore';


-- Find Missing Values for Life Expectancy

SELECT Country, [Life Expectancy]
FROM WorldData
WHERE [Life Expectancy] IS NULL;


-- Impute with the Mean Value

UPDATE WorldData
SET [Life Expectancy] = (SELECT AVG([Life Expectancy]) FROM WorldData)
WHERE [Life Expectancy] IS NULL;


-- Find Missing Values for Maternal Mortality Ratio

SELECT Country, [Maternal Mortality Ratio]
FROM WorldData
WHERE [Maternal Mortality Ratio] IS NULL;


-- Impute with the Mean Value

UPDATE WorldData
SET [Maternal Mortality Ratio] = (SELECT AVG([Maternal Mortality Ratio]) FROM WorldData)
WHERE [Maternal Mortality Ratio] IS NULL;


-- Find Missing Values for Minimum wage

SELECT Country, [Minimum Wage]
FROM WorldData
WHERE [Minimum Wage] IS NULL;


-- Impute with the Mean Value

UPDATE WorldData
SET [Minimum Wage] = (SELECT AVG([Minimum Wage]) FROM WorldData)
WHERE [Minimum Wage] IS NULL;


-- Find Missing Values for Official Language

SELECT Country, [Official Language]
FROM WorldData
WHERE [Official Language] IS NULL;

-- No missing values


-- Find missing values for Out of Pocket Health Expenditure

SELECT Country, [Out of Pocket Health Expenditure]
FROM WorldData
WHERE [Out of Pocket Health Expenditure] IS NULL;


-- Impute with the Mean Value

UPDATE WorldData
SET [Out of Pocket Health Expenditure] = (SELECT AVG([Out of Pocket Health Expenditure]) FROM WorldData)
WHERE [Out of Pocket Health Expenditure] IS NULL;


-- Find missing values for Physicians Per Thousand

SELECT Country, [Physicians Per Thousand]
FROM WorldData
WHERE [Physicians Per Thousand] IS NULL;



--Impute with a Specific Value:

UPDATE WorldData
SET [Physicians Per Thousand] = 0.00
WHERE [Physicians Per Thousand] IS NULL;



-- Find missing values for Population

SELECT Country, [Population] 
FROM WorldData
WHERE [Population] IS NULL;

-- No missing values


-- Find missing values for Population: Labor Force Participation

SELECT Country, [Population: Labor Force Participation] 
FROM WorldData
WHERE [Population: Labor Force Participation] IS NULL;

-- Impute with the mean vales

UPDATE WorldData
SET [Population: Labor Force Participation] = (SELECT AVG([Population: Labor Force Participation]) FROM WorldData)
WHERE [Population: Labor Force Participation] IS NULL;



-- Find missing values for Tax Revenue

SELECT Country, [Tax Revenue] 
FROM WorldData
WHERE [Tax Revenue] IS NULL;


-- Impute with the mean vales

UPDATE WorldData
SET [Tax Revenue] = (SELECT AVG([Tax Revenue]) FROM WorldData)
WHERE [Tax Revenue] IS NULL;


-- Find Missing Values for Total Tax Rate

SELECT Country, [Total Tax Rate]
FROM WorldData
WHERE [Total Tax Rate] IS NULL;


-- Impute with the mean vales

UPDATE WorldData
SET [Total Tax Rate] = (SELECT AVG([Total Tax Rate]) FROM WorldData)
WHERE [Total Tax Rate] IS NULL;



-- Find Missing Values for Unemployment Rate

SELECT Country, [Unemployment Rate]
FROM WorldData
WHERE [Unemployment Rate] IS NULL;


-- Impute with the mean vales

UPDATE WorldData
SET [Unemployment Rate] = (SELECT AVG([Unemployment Rate]) FROM WorldData)
WHERE [Unemployment Rate] IS NULL;


-- Find Missing Values for Urban Population

SELECT Country, [Urban Population]
FROM WorldData
WHERE [Urban Population] IS NULL;

-- No missing values


-- Find Missing Values for Urban Population

SELECT Country, [Latitude]
FROM WorldData
WHERE [Latitude] IS NULL;

-- No missing values


SELECT Country, [Longitude]
FROM WorldData
WHERE [Longitude] IS NULL;

-- No missing values