-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    "card_holder_id" INT   NOT NULL,
    "card_holder_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "card_holder_id"
     )
);

CREATE TABLE "credit_card" (
    "credit_card_number" VARCHAR(20)   NOT NULL,
    "credit_card_holder_id" INT   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "credit_card_number"
     )
);

CREATE TABLE "merchant_category" (
    "merchant_category_id" INT   NOT NULL,
    "merchant_category_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "merchant_category_id"
     )
);

CREATE TABLE "merchants" (
    "merchants_id" INT   NOT NULL,
    "merchants_name" VARCHAR(255)   NOT NULL,
    "merchant_category_id" INT   NOT NULL,
    CONSTRAINT "pk_merchants" PRIMARY KEY (
        "merchants_id"
     )
);

CREATE TABLE "transactions" (
    "transaction_id" BIGINT   NOT NULL,
    "transaction_datetimestamp" TIMESTAMP   NOT NULL,
    "transaction_amount" FLOAT   NOT NULL,
    "credit_card_number" VARCHAR(20)   NOT NULL,
    "merchant_id" INT   NOT NULL,
    CONSTRAINT "pk_transactions" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_credit_card_holder_id" FOREIGN KEY("credit_card_holder_id")
REFERENCES "card_holder" ("card_holder_id");

ALTER TABLE "merchants" ADD CONSTRAINT "fk_merchants_merchant_category_id" FOREIGN KEY("merchant_category_id")
REFERENCES "merchant_category" ("merchant_category_id");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_credit_card_number" FOREIGN KEY("credit_card_number")
REFERENCES "credit_card" ("credit_card_number");

ALTER TABLE "transactions" ADD CONSTRAINT "fk_transactions_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "merchants" ("merchants_id");

