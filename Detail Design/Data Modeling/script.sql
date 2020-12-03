-- Creator:       MySQL Workbench 8.0.20/ExportSQLite Plugin 0.1.0
-- Author:        Admin
-- Caption:       New Model
-- Project:       Name of the project
-- Changed:       2020-12-02 17:27
-- Created:       2020-12-02 16:51
PRAGMA foreign_keys = OFF;

-- Schema: mydb
ATTACH "mydb.sdb" AS "mydb";
BEGIN;
CREATE TABLE "mydb"."DeliveryInfo"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "name" VARCHAR(45),
  "province" VARCHAR(45),
  "instructions" VARCHAR(200),
  "address" VARCHAR(100)
);
CREATE TABLE "mydb"."Media"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "category" VARCHAR(45),
  "price" INTEGER,
  "quantity" INTEGER,
  "title" VARCHAR(45),
  "value" INTEGER,
  "imageUrl" VARCHAR(45)
);
CREATE TABLE "mydb"."CD"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "artist" VARCHAR(45),
  "recordLabel" VARCHAR(45),
  "musicType" VARCHAR(45),
  "releasedDate" DATE
);
CREATE TABLE "mydb"."Book"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "author" VARCHAR(45),
  "coverType" VARCHAR(45),
  "publisher" VARCHAR(45),
  "publishDate" DATETIME,
  "numOfPages" INTEGER,
  "language" VARCHAR(45),
  "bookCategory" VARCHAR(45)
);
CREATE TABLE "mydb"."Card"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "cardCode" VARCHAR(45),
  "owner" VARCHAR(45),
  "cvvCode" VARCHAR(45),
  "dateExpired" VARCHAR(45)
);
CREATE TABLE "mydb"."DVD"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "discType" VARCHAR(45),
  "director" VARCHAR(45),
  "studio" VARCHAR(45),
  "subtitle" VARCHAR(45),
  "runtime" INTEGER,
  "releaseDate" DATETIME
);
CREATE TABLE "mydb"."Order"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "shippingFees" VARCHAR(45),
  "deliveryInfoId" INTEGER,
  CONSTRAINT "fk_order_delivery"
    FOREIGN KEY("deliveryInfoId")
    REFERENCES "DeliveryInfo"("id")
);
CREATE INDEX "mydb"."Order.fk_order_delivery_idx" ON "Order" ("deliveryInfoId");
CREATE TABLE "mydb"."OrderMedia"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "price" INTEGER,
  "quantity" INTEGER,
  "mediaId" INTEGER,
  CONSTRAINT "fk_ordermedia_media"
    FOREIGN KEY("mediaId")
    REFERENCES "Media"("id")
);
CREATE INDEX "mydb"."OrderMedia.fk_ordermedia_media_idx" ON "OrderMedia" ("mediaId");
CREATE TABLE "mydb"."Invoice"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "totalAmount" INTEGER,
  "orderId" INTEGER NOT NULL,
  CONSTRAINT "fk_invoice_order"
    FOREIGN KEY("orderId")
    REFERENCES "Order"("id")
);
CREATE INDEX "mydb"."Invoice.fk_invoice_order_idx" ON "Invoice" ("orderId");
CREATE TABLE "mydb"."PaymentTransaction"(
  "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  "createdAt" DATETIME,
  "method" VARCHAR(45),
  "content" VARCHAR(45),
  "cardId" INTEGER,
  "invoiceId" INTEGER,
  CONSTRAINT "fk_payment_invoice"
    FOREIGN KEY("invoiceId")
    REFERENCES "Invoice"("id"),
  CONSTRAINT "fk_payment_card"
    FOREIGN KEY("cardId")
    REFERENCES "Card"("id")
);
CREATE INDEX "mydb"."PaymentTransaction.fk_payment_invoice_idx" ON "PaymentTransaction" ("invoiceId");
CREATE INDEX "mydb"."PaymentTransaction.fk_payment_card_idx" ON "PaymentTransaction" ("cardId");
COMMIT;
