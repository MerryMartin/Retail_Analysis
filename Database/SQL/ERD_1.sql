-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Customer" (
    "IID" varchar(50)   NOT NULL,
    "AGE_" int   NOT NULL,
    "INCOME" int   NOT NULL,
    "ETHNIC_CODE_GROUP" varchar(10)   NOT NULL,
    "AN_BIRTHDAY" datetime   NOT NULL,
    "POSTAL_CD" int   NOT NULL,
    "CUSTOMER_STATE" varchar(50)   NOT NULL,
    "CUSTOMER_REGION" varchar(50)   NOT NULL,
    CONSTRAINT "pk_Customer" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "EthnicCodes" (
    "IID" varchar(50)   NOT NULL,
    "ETHNIC_CODE_GROUP" varchar(10)   NOT NULL,
    "ETHNIC_Description" varchar(50)   NOT NULL,
    CONSTRAINT "pk_EthnicCodes" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "Loyalty" (
    "IID" varchar(50)   NOT NULL,
    "INCOME" int   NOT NULL,
    "INCOME_DESCRIPTION" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Loyalty" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "Orders" (
    "IID" varchar(50)   NOT NULL,
    "FIRST_ANTHRO_ORDER" datetime   NOT NULL,
    "LIFETIME_APPAREL_DEMAND" float   NOT NULL,
    "LIFETIME_APPAREL_ORDERS" int   NOT NULL,
    "ORDER_DT" datetime   NOT NULL,
    "ORDER_ID" varchar(100)   NOT NULL,
    "ORDER_LINE_SEQ" int   NOT NULL,
    "PURCHASE_CHANNEL_DERIVED" varchar(50)   NOT NULL,
    "DEMAND_QTY" int   NOT NULL,
    "DEMAND_AMT" float   NOT NULL,
    "PRODUCT_ID" int   NOT NULL,
    CONSTRAINT "pk_Orders" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "Income" (
    "IID" varchar(50)   NOT NULL,
    "INCOME" int   NOT NULL,
    "INCOME_DESCRIPTION" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Income" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "Store" (
    "STORE_NUM" int   NOT NULL,
    "ORDER_ID" varchar(100)   NOT NULL,
    "STORE_NAME" varchar(100)   NOT NULL,
    "STORE_ZIP" int   NOT NULL,
    "STORE_STATE" varchar(100)   NOT NULL,
    "STORE_REGION" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Store" PRIMARY KEY (
        "STORE_NUM"
     )
);

CREATE TABLE "Product" (
    "PRODUCT_ID" int   NOT NULL,
    "DIVISION_NAME" varchar(100)   NOT NULL,
    "DEPARTMENT_NAME" varchar(100)   NOT NULL,
    "CLASS_NAME" varchar(100)   NOT NULL,
    "ITEM_NAME" varchar(100)   NOT NULL,
    "MD_STATE" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Product" PRIMARY KEY (
        "PRODUCT_ID"
     )
);

ALTER TABLE "EthnicCodes" ADD CONSTRAINT "fk_EthnicCodes_IID" FOREIGN KEY("IID")
REFERENCES "Customer" ("IID");

ALTER TABLE "Loyalty" ADD CONSTRAINT "fk_Loyalty_IID" FOREIGN KEY("IID")
REFERENCES "Customer" ("IID");

ALTER TABLE "Orders" ADD CONSTRAINT "fk_Orders_IID" FOREIGN KEY("IID")
REFERENCES "Customer" ("IID");

ALTER TABLE "Orders" ADD CONSTRAINT "fk_Orders_PRODUCT_ID" FOREIGN KEY("PRODUCT_ID")
REFERENCES "Product" ("PRODUCT_ID");

ALTER TABLE "Income" ADD CONSTRAINT "fk_Income_IID_INCOME" FOREIGN KEY("IID", "INCOME")
REFERENCES "Customer" ("IID", "INCOME");

ALTER TABLE "Store" ADD CONSTRAINT "fk_Store_ORDER_ID" FOREIGN KEY("ORDER_ID")
REFERENCES "Orders" ("ORDER_ID");

