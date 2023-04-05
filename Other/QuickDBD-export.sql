-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Customer" (
    "IID" string   NOT NULL,
    "AGE_" int   NOT NULL,
    "INCOME" int   NOT NULL,
    "ETHNIC_CODE_GROUP" string   NOT NULL,
    "AN_BIRTHDAY" datetime   NOT NULL,
    "POSTAL_CD" float   NOT NULL,
    CONSTRAINT "pk_Customer" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "EthnicCodes" (
    "IID" string   NOT NULL,
    "ETHNIC_CODE_GROUP" string   NOT NULL,
    "ETHNIC_DESCRIPTION" string   NOT NULL,
    CONSTRAINT "pk_EthnicCodes" PRIMARY KEY (
        "IID","ETHNIC_CODE_GROUP"
     )
);

CREATE TABLE "Loyalty" (
    "IID" string   NOT NULL,
    "LOYALTY_YN" string   NOT NULL,
    "LOYALTY_ENROLLMENT_DT" datetime   NOT NULL,
    CONSTRAINT "pk_Loyalty" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "Income" (
    "IID" string   NOT NULL,
    "INCOME" int   NOT NULL,
    "INCOME_DESCRIPTION" string   NOT NULL,
    CONSTRAINT "pk_Income" PRIMARY KEY (
        "IID"
     )
);

CREATE TABLE "Orders" (
    "IID" string   NOT NULL,
    "FIRST_ANTHRO_ORDER" datetime   NOT NULL,
    "LIFETIME_APPAREL_DEMAND" float   NOT NULL,
    "LIFETIME_APPAREL_ORDERS" int   NOT NULL,
    "ORDER_DT" datetime   NOT NULL,
    "ORDER_ID" string   NOT NULL,
    "ORDER_LINE_SEQ" int   NOT NULL,
    "PURCHASE_CHANNEL_DERIVED" string   NOT NULL,
    "DEMAND_QTY" int   NOT NULL,
    "DEMAND_AMT" float   NOT NULL,
    "PRODUCT_ID" int   NOT NULL
);

CREATE TABLE "Store" (
    "ORDER_ID" string   NOT NULL,
    "STORE_NUM" int   NOT NULL,
    "STORE_NAME" string   NOT NULL,
    "STORE_ZIP" string   NOT NULL,
    CONSTRAINT "pk_Store" PRIMARY KEY (
        "STORE_NUM"
     )
);

CREATE TABLE "Product" (
    "PRODUCT_ID" int   NOT NULL,
    "DIVISION_NAME" string   NOT NULL,
    "DEPARTMENT_NAME" string   NOT NULL,
    "CLASS_NAME" string   NOT NULL,
    "ITEM_NAME" string   NOT NULL,
    "MD_STATE" string   NOT NULL,
    CONSTRAINT "pk_Product" PRIMARY KEY (
        "PRODUCT_ID"
     )
);

ALTER TABLE "Customer" ADD CONSTRAINT "fk_Customer_IID" FOREIGN KEY("IID")
REFERENCES "Loyalty" ("IID");

ALTER TABLE "Customer" ADD CONSTRAINT "fk_Customer_INCOME" FOREIGN KEY("INCOME")
REFERENCES "Income" ("INCOME");

ALTER TABLE "Orders" ADD CONSTRAINT "fk_Orders_IID" FOREIGN KEY("IID")
REFERENCES "Customer" ("IID");

ALTER TABLE "Orders" ADD CONSTRAINT "fk_Orders_PRODUCT_ID" FOREIGN KEY("PRODUCT_ID")
REFERENCES "Product" ("PRODUCT_ID");

ALTER TABLE "Store" ADD CONSTRAINT "fk_Store_ORDER_ID" FOREIGN KEY("ORDER_ID")
REFERENCES "Orders" ("ORDER_ID");

