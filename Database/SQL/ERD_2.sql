-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Main" (
    "IID" varchar(100)   NOT NULL,
    "AGE_" int   NOT NULL,
    "INCOME" int   NOT NULL,
    "ETHNIC_CODE_GROUP" varchar(10)   NOT NULL,
    "AN_BIRTHDAY" varchar(10)   NOT NULL,
    "POSTAL_CD" int   NOT NULL,
    "LOYALTY_YN" varchar(10)   NOT NULL,
    "LOYALTY_ENROLLMENT_DT" datetime   NOT NULL,
    "FIRST_ANTHRO_ORDER" datetime   NOT NULL,
    "LIFETIME_APPAREL_DEMAND" float   NOT NULL,
    "LIFETIME_APPAREL_ORDERS" int   NOT NULL,
    "ORDER_DT" datetime   NOT NULL,
    "ORDER_ID" varchar(100)   NOT NULL,
    "ORDER_LINE_SEQ" int   NOT NULL,
    "PURCHASE_CHANNEL_DERIVED" varchar(50)   NOT NULL,
    "STORE_NUM" int   NOT NULL,
    "STORE_NAME" varchar(100)   NOT NULL,
    "STORE_ZIP" int   NOT NULL,
    "DIVISION_NAME" varchar(100)   NOT NULL,
    "DEPARTMENT_NAME" varchar(100)   NOT NULL,
    "CLASS_NAME" varchar(100)   NOT NULL,
    "PRODUCT_ID" int   NOT NULL,
    "ITEM_NAME" varchar(100)   NOT NULL,
    "MD_STATE" varchar(100)   NOT NULL,
    "DEMAND_QTY" int   NOT NULL,
    "DEMAND_AMT" float   NOT NULL,
    "CUSTOMER_STATE" varchar(20)   NOT NULL,
    "CUSTOMER_REGION" varchar(50)   NOT NULL,
    "STORE_STATE" varchar(20)   NOT NULL,
    "STORE_REGION" varchar(50)   NOT NULL
);

CREATE TABLE "Ethnic_Group" (
    "VALUE" varchar(10)   NOT NULL,
    "DESCRIPTION" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Ethnic_Group" PRIMARY KEY (
        "VALUE"
     )
);

CREATE TABLE "Income" (
    "VALUE" int   NOT NULL,
    "DESCRIPTION" varchar(100)   NOT NULL,
    CONSTRAINT "pk_Income" PRIMARY KEY (
        "VALUE"
     )
);

ALTER TABLE "Ethnic_Group" ADD CONSTRAINT "fk_Ethnic_Group_VALUE" FOREIGN KEY("VALUE")
REFERENCES "Main" ("ETHNIC_CODE_GROUP");

ALTER TABLE "Income" ADD CONSTRAINT "fk_Income_VALUE" FOREIGN KEY("VALUE")
REFERENCES "Main" ("INCOME");

