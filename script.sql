															/*****************Country************************/
                                                            
Create database Country;
use Country;

drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/country/country_daily_speeds.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists country;
CREATE TABLE `country` (
  `id` serial,
  `country` varchar(55) DEFAULT NULL,
  `country_code` varchar(5) NOT NULL,
  PRIMARY KEY (`country_code`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into Country.country(country,country_code) select country,country_code from t;

drop table if exists t;
#select count(Distinct(country)) from country
#Select count(Distinct(country_code)) from t

														/*****************CountryInfo************************/

Create database CountryInfo;
use CountryInfo;
/******country_daily_promise******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `date` text,
  `median_download_ratio` double DEFAULT NULL,
  `median_upload_ratio` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/country/country_daily_promise.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists country_daily_promise;
CREATE TABLE `country_daily_promise` (
  id serial,
  `country_code` text,
  `date` text,
  `median_download_ratio` double DEFAULT NULL,
  `median_upload_ratio` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into CountryInfo.country_daily_promise(country_code,date,median_download_ratio,median_upload_ratio,total_surveys) select country_code,date,median_download_ratio,median_upload_ratio,total_surveys from t;

#Select count(*) from country_daily_promise
#Select count(Distinct(country)) from t

/******country_daily_quality******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/country/country_daily_quality.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists country_daily_quality;
CREATE TABLE `country_daily_quality` (
  `id` serial,
  `country_code` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into CountryInfo.country_daily_quality(country_code,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles) select country_code,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles from t;

#Select count(*) from country_daily_quality
#Select count(Distinct(country)) from t

/******country_daily_speeds******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/country/country_daily_speeds.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists country_daily_speeds;
CREATE TABLE `country_daily_speeds` (
  `id` serial,
  `country_code` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into CountryInfo.country_daily_speeds(country_code,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,date,download_kbps,upload_kbps,total_tests,distance_miles from t;

#Select count(*) from country_daily_speeds
#Select count(Distinct(country)) from t

/******country_daily_value******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `date` text,
  `median_usd_mbps_down` double DEFAULT NULL,
  `median_usd_mbps_up` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/country/country_daily_value.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists country_daily_value;
CREATE TABLE `country_daily_value` (
  `id` serial,
  `country_code` text,
  `date` text,
  `median_usd_mbps_down` double DEFAULT NULL,
  `median_usd_mbps_up` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into CountryInfo.country_daily_value(country_code,date,median_usd_mbps_down,median_usd_mbps_up,total_surveys) select country_code,date,median_usd_mbps_down,median_usd_mbps_up,total_surveys from t;

#Select count(*) from country_daily_value
#Select count(Distinct(country)) from t

/******country_isp_daily_quality******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `isp_name` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/country/country_isp_daily_quality.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists country_isp_daily_quality;
CREATE TABLE `country_isp_daily_quality` (
  `id` serial,
  `country_code` text,
  `isp_name` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into CountryInfo.country_isp_daily_quality(country_code,isp_name,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles) select country_code,isp_name,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles from t;

#Select count(*) from country_isp_daily_quality
#Select count(Distinct(country)) from t

															/*****************REGION************************/
                                                            
Create database Region;
use Region;
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/region/region_daily_speeds.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists region;
CREATE TABLE `region` (
  `id` serial,
  `region` varchar(55) DEFAULT NULL,
  `region_code` varchar(5) NOT NULL,
  `country_code` varchar(5) NOT NULL,  
  PRIMARY KEY (`region_code`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into Region.region(region,region_code,country_code) select region,region_code,country_code from t;

drop table if exists t;
#select count(Distinct(region)) from region
#Select count(Distinct(region_code)) from t

														/*****************RegionInfo************************/

Create database RegionInfo;
use RegionInfo;
/******region_daily_promise******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `median_download_ratio` double DEFAULT NULL,
  `median_upload_ratio` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/region/region_daily_promise.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists region_daily_promise;
CREATE TABLE `region_daily_promise` (
  `id` serial,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `median_download_ratio` double DEFAULT NULL,
  `median_upload_ratio` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL,
  Primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into RegionInfo.region_daily_promise(country_code,region,region_code,date,median_download_ratio, median_upload_ratio,total_surveys) select country_code,region,region_code,date,median_download_ratio, median_upload_ratio,total_surveys from t;

#Select count(*) from region_daily_promise
#Select count(Distinct(region)) from t  62

/******region_daily_quality******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/region/region_daily_quality.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists region_daily_quality;
CREATE TABLE `region_daily_quality` (
  `id` serial,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into RegionInfo.region_daily_quality(country_code,region,region_code,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles) select country_code,region,region_code,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles from t;

#Select count(*) from region_daily_quality
#Select count(Distinct(region)) from t 55

/******region_daily_speeds******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/region/region_daily_speeds.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists region_daily_speeds;
CREATE TABLE `region_daily_speeds` (
  `id` serial,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into RegionInfo.region_daily_speeds(country_code,region,region_code,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,date,download_kbps,upload_kbps,total_tests,distance_miles from t;

#Select count(*) from region_daily_speeds
#Select count(Distinct(region)) from t 64

/******region_daily_value******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `median_res_usd_down` double DEFAULT NULL,
  `median_res_usd_up` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/region/region_daily_value.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists region_daily_value;
CREATE TABLE `region_daily_value` (
  `id` serial,
  `country_code` text,
  `region` text,
  `region_code` text,
  `date` text,
  `median_res_usd_down` double DEFAULT NULL,
  `median_res_usd_up` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into RegionInfo.region_daily_value(country_code,region,region_code,date,median_res_usd_down, median_res_usd_up,total_surveys) select country_code,region,region_code,date,median_res_usd_down, median_res_usd_up,total_surveys from t;

#Select count(*) from region_daily_value
#Select count(Distinct(region)) from t 61

/******region_isp_daily_quality******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `isp_name` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/region/region_isp_daily_quality.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists region_isp_daily_quality;
CREATE TABLE `region_isp_daily_quality` (
  `id` serial,
  `country_code` text,
  `region` text,
  `region_code` text,
  `isp_name` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into RegionInfo.region_isp_daily_quality(country_code,region,region_code,isp_name,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles from t;

#Select count(*) from region_isp_daily_quality
#Select count(Distinct(region)) from t 55

/******region_isp_daily_speeds******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `isp_name` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/region/region_isp_daily_speeds.csv' 
INTO TABLE  t
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

ALter table t add column id serial;

Drop table if exists region_isp_daily_speeds;
CREATE TABLE `region_isp_daily_speeds` (
  `id` serial,
  `country_code` text,
  `region` text,
  `region_code` text,
  `isp_name` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id<=500000;
insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id>500000 and t.id<=1000000;
insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id>1000000 and t.id<=1500000;
insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id>1500000 and t.id<=2000000;
insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id>2000000 and t.id<=2500000;
insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id>2500000 and t.id<=3000000;
insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id>3000000 and t.id<=3500000;
insert ignore into RegionInfo.region_isp_daily_speeds(country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select country_code,region,region_code,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t where t.id>3500000;

#Select count(*) from region_isp_daily_speeds
#Select count(Distinct(region)) from t 64



/****************************************************************************/


/****************POR ACABAR**************************************************/


/****************************************************************************/

															/*****************CITY************************/
Create database City;
use City;
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `city` text,
  `date` text,
  `median_download_ratio` double DEFAULT NULL,
  `median_upload_ratio` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/city_daily_promise.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists city;
CREATE TABLE `city` (
  `id` serial,
  `city` varchar(255) NOT NULL,
  `region_code` varchar(5) NOT NULL,
  `country_code` varchar(5) NOT NULL,  
  PRIMARY KEY (`city`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into City.city(city,region_code,country_code) select city,region_code,country_code from t;

drop table if exists t;
#select count(Distinct(city)) from city
#Select count(Distinct(region_code)) from t
#Select Distinct(city) from city

														/*****************CityInfo************************/

Create database CityInfo;
use CityInfo;
/******city_daily_promise******/

drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `city` text,
  `date` text,
  `median_download_ratio` double DEFAULT NULL,
  `median_upload_ratio` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/city_daily_promise.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists city_daily_promise;
CREATE TABLE `city_daily_promise` (
  `id` serial,
  `city` text,
  `date` text,
  `median_download_ratio` double DEFAULT NULL,
  `median_upload_ratio` double DEFAULT NULL,
  `total_surveys` int DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into CityInfo.city_daily_promise(city,date,median_download_ratio,median_upload_ratio,total_surveys) select city,date,median_download_ratio,median_upload_ratio,total_surveys from t;

#Select count(*) from city_daily_promise
#Select count(Distinct(city)) from t  2699


/******city_daily_quality******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `city` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/city_daily_quality.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

Drop table if exists city_daily_quality;
CREATE TABLE `city_daily_quality` (
  `id` serial,
  `city` text,
  `date` text,
  `rfactor` double DEFAULT NULL,
  `jitter` double DEFAULT NULL,
  `packet_loss` double DEFAULT NULL,
  `latency` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY Key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

insert ignore into CityInfo.city_daily_quality(city,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles) select city,date,rfactor,jitter,packet_loss,latency,total_tests,distance_miles from t;

#Select count(*) from city_daily_quality
#Select count(Distinct(city)) from t 1252

/******city_daily_speeds******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `city` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

Drop table if exists city_daily_speeds;
CREATE TABLE `city_daily_speeds` (
  `id` serial,
  `city` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part1-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part2-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part3-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part4-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part5-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part6-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part7-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part8-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part9-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part10-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part11-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part12-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part13-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part14-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part15-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part16-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part17-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part18-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part19-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part20-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part21-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part22-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part23-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part24-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part25-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part26-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part27-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part28-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part29-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part30-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part31-city_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_daily_speeds(city,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;


#Select count(*) from city_daily_speeds
#Select count(Distinct(city)) from city_daily_speeds

/******city_isp_daily_speeds******/
drop table if exists t;
CREATE temporary TABLE t (
  `country` text,
  `country_code` text,
  `region` text,
  `region_code` text,
  `city` text,
  `isp_name` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL
);

Drop table if exists city_isp_daily_speeds;
CREATE TABLE `city_isp_daily_speeds` (
  `id` serial,
  `city` text,
  `isp_name` text,
  `date` text,
  `download_kbps` double DEFAULT NULL,
  `upload_kbps` double DEFAULT NULL,
  `total_tests` int DEFAULT NULL,
  `distance_miles` double DEFAULT NULL,
  PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part1-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part2-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part3-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part4-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part5-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part6-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part7-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part8-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part9-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part10-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part11-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part12-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part13-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part14-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part15-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part16-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part17-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part18-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part19-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part20-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part21-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part22-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part23-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part24-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part25-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part26-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part27-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part28-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part29-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part30-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part31-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part32-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part33-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part34-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

LOAD DATA LOCAL INFILE '/home/brunavieites/Desktop/Dataset/city/Part35-city_isp_daily_speeds.csv' 
INTO TABLE  t
CHARACTER SET latin1
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

insert ignore into CityInfo.city_isp_daily_speeds(city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles) select city,isp_name,date,download_kbps,upload_kbps,total_tests,distance_miles from t;
truncate table t;

#Select count(*) from city_isp_daily_speeds
#Select count(Distinct(city)) from city_isp_daily_speeds


