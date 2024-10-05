-- CreateTable
CREATE TABLE "School" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "fromEmail" TEXT NOT NULL,
    "replyEmail" TEXT,
    "phoneNumber" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Owner" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "profileImage" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Contact" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "active" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "SocialMedia" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "schoolId" INTEGER,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL,
    CONSTRAINT "SocialMedia_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "School" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Campaign" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "subject" TEXT NOT NULL,
    "html" TEXT,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "_OwnerToSchool" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_OwnerToSchool_A_fkey" FOREIGN KEY ("A") REFERENCES "Owner" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_OwnerToSchool_B_fkey" FOREIGN KEY ("B") REFERENCES "School" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_ContactToSchool" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_ContactToSchool_A_fkey" FOREIGN KEY ("A") REFERENCES "Contact" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ContactToSchool_B_fkey" FOREIGN KEY ("B") REFERENCES "School" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "School_fromEmail_key" ON "School"("fromEmail");

-- CreateIndex
CREATE UNIQUE INDEX "School_replyEmail_key" ON "School"("replyEmail");

-- CreateIndex
CREATE UNIQUE INDEX "Contact_name_key" ON "Contact"("name");

-- CreateIndex
CREATE UNIQUE INDEX "_OwnerToSchool_AB_unique" ON "_OwnerToSchool"("A", "B");

-- CreateIndex
CREATE INDEX "_OwnerToSchool_B_index" ON "_OwnerToSchool"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ContactToSchool_AB_unique" ON "_ContactToSchool"("A", "B");

-- CreateIndex
CREATE INDEX "_ContactToSchool_B_index" ON "_ContactToSchool"("B");
