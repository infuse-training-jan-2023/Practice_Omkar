CREATE TABLE "items"(
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"item" TEXT NOT NULL,
	"status" TEXT NOT NULL,
	"reminder" BOOLEAN
);
CREATE TABLE "users"(
	"id" INTEGER PRIMARY KEY AUTOINCREMENT,
	"name" TEXT NOT NULL,
	"age" INTEGER NOT NULL
);