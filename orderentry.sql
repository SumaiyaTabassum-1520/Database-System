DROP TABLE Client cascade constraints;
DROP TABLE Employee cascade constraints;
DROP TABLE Product cascade constraints;
DROP TABLE OrderTbl cascade constraints;
DROP TABLE OrdLine cascade constraints;

CREATE TABLE Client
( 	ClientNo 	        CHAR(8),
    ClientFirstName    VARCHAR2(20) CONSTRAINT ClientFirstNameRequired NOT NULL,
    ClientLastName     VARCHAR2(30) CONSTRAINT ClientLastNameRequired NOT NULL,
	ClientStreet	VARCHAR2(50),
	ClientCity	VARCHAR2(30),
   	ClientState	CHAR(2),
	ClientZip		CHAR(10),
	ClientBal		DECIMAL(12,2) DEFAULT 0,
 CONSTRAINT PKClient PRIMARY KEY (ClientNo)  );

CREATE TABLE Employee
( 	EmpNo 	 	CHAR(8),
  	EmpFirstName    VARCHAR2(20) CONSTRAINT EmpFirstNameRequired NOT NULL,
	EmpLastName     VARCHAR2(30) CONSTRAINT EmpLastNameRequired NOT NULL,
	EmpPhone        CHAR(15),
	EmpEMail        VARCHAR(50) CONSTRAINT EmpEMailRequired NOT NULL,
   	SupEmpNo 	CHAR(8),
        EmpCommRate	DECIMAL(3,3),
CONSTRAINT PKEmployee PRIMARY KEY (EmpNo),
CONSTRAINT UniqueEMail UNIQUE(EmpEMail),
CONSTRAINT FKSupEmpNo FOREIGN KEY (SupEmpNo) REFERENCES Employee );

CREATE TABLE Product
( 	ProdNo 	         CHAR(8),
  	ProdName	 VARCHAR2(50) CONSTRAINT ProdNameRequired NOT NULL,
	ProdMfg	         VARCHAR2(20) CONSTRAINT ProdMfgRequired NOT NULL,
	ProdQOH	         INTEGER,
	ProdPrice        DECIMAL(12,2),
        ProdNextShipDate DATE,
 CONSTRAINT PKProduct PRIMARY KEY (ProdNo)  );

CREATE TABLE OrderTbl
( 	OrdNo 	   CHAR(8),
  	OrdDate	   DATE    CONSTRAINT OrdDateRequired NOT NULL,
	ClientNo	   CHAR(8) CONSTRAINT ClientNoRequired NOT NULL,
        EmpNo	   CHAR(8),
        OrdName    VARCHAR2(50),
        OrdStreet  VARCHAR2(50),
        OrdCity    VARCHAR2(30),
        OrdState   CHAR(2),
        OrdZip     CHAR(10),
CONSTRAINT PKOrderTbl PRIMARY KEY (OrdNo),
CONSTRAINT FKClientNo FOREIGN KEY (ClientNo) REFERENCES Client,
CONSTRAINT FKEmpNo FOREIGN KEY (EmpNo) REFERENCES Employee  );

CREATE TABLE OrdLine
( 	OrdNo 	CHAR(8),
  	ProdNo	CHAR(8),
	Qty		INTEGER DEFAULT 1,
CONSTRAINT PKOrdLine PRIMARY KEY (OrdNo, ProdNo), 
CONSTRAINT FKOrdNo FOREIGN KEY (OrdNo) REFERENCES OrderTbl
  ON DELETE CASCADE, 
CONSTRAINT FKProdNo FOREIGN KEY (ProdNo) REFERENCES Product  );

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C0954327','Sheri','Gordon','336 Hill St.','Littleton','CO','80129-5543',230.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C1010398','Jim','Glussman','1432 E. Ravenna','Denver','CO','80111-0033',200.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C2388597','Beth','Taylor','2396 Rafter Rd','Seattle','WA','98103-1121',500.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C3340959','Betty','Wise','4334 153rd NW','Seattle','WA','98178-3311',200.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C3499503','Bob','Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095',0.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C8543321','Ron','Thompson','789 122nd St.','Renton','WA','98666-1289',85.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C8574932','Wally','Jones','411 Webber Ave.','Seattle','WA','98105-1093',1500.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C8654390','Candy','Kendall','456 Pine St.','Seattle','WA','98105-3345',50.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9128574','Jerry','Wyatt','16212 123rd Ct.','Denver','CO','80222-0022',100.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9403348','Mike','Boren','642 Crest Ave.','Englewood','CO','80113-5431',0.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9432910','Larry','Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211',250.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9543029','Sharon','Johnson','1223 Meyer Way','Fife','WA','98222-1123',856.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9549302','Todd','Hayes','1400 NW 88th','Lynnwood','WA','98036-2244',0.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9857432','Homer','Wells','123 Main St.','Seattle','WA','98105-4322',500.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9865874','Mary','Hill','206 McCaffrey','Littleton','CO','80129-5543',150.00);

INSERT INTO Client
	(ClientNo, ClientFirstName, ClientLastName, ClientStreet, ClientCity,
 	ClientState, ClientZip, ClientBal) 
	VALUES('C9943201','Harry','Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258',1000.00);

INSERT INTO employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail,
 	SupEmpNo, EmpCommRate)
	VALUES ('E9884325','Thomas','Johnson','(303) 556-9987','TJohnson@bigco.com','',0.05);

INSERT INTO employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail,
 	SupEmpNo, EmpCommRate)
	VALUES ('E8843211','Amy','Tang','(303) 556-4321','ATang@bigco.com','E9884325',0.04);

INSERT INTO employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail,
 	SupEmpNo, EmpCommRate)
	VALUES ('E9345771','Colin','White','(303) 221-4453','CWhite@bigco.com','E9884325',0.04);

INSERT INTO employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail,
 	SupEmpNo, EmpCommRate)
	VALUES ('E1329594','Landi','Santos','(303) 789-1234','LSantos@bigco.com','E8843211',0.02);

INSERT INTO employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail,
 	SupEmpNo, EmpCommRate)
	VALUES ('E8544399','Joe','Jenkins','(303) 221-9875','JJenkins@bigco.com','E8843211',0.02);

INSERT INTO employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail,
 	SupEmpNo, EmpCommRate)
	VALUES ('E9954302','Mary','Hill','(303) 556-9871','MHill@bigco.com','E8843211',0.02);

INSERT INTO employee
	(EmpNo, EmpFirstName, EmpLastName, EmpPhone, EmpEMail,
 	SupEmpNo)
	VALUES ('E9973110','Theresa','Beck','(720) 320-2234','TBeck@bigco.com','E9884325');

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P0036566','17 inch Color Monitor','ColorMeg, Inc.',12,'02/12/2013',169.00);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P0036577','19 inch Color Monitor','ColorMeg, Inc.',10,'02/12/2013',319.00);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P1114590','R3000 Color Laser Printer','Connex',5,'01/22/2013',699.00);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P1412138','10 Foot Printer Cable','Ethlite',100,'',12.00);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P1445671','8-Outlet Surge Protector','Intersafe',33,'',14.99);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P1556678','CVP Ink Jet Color Printer','Connex',8, '01/22/2013',99.00);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P3455443','Color Ink Jet Cartridge','Connex',24,'01/22/2013',38.00);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P4200344','36-Bit Color Scanner','UV Components',16,'01/29/2013',199.99);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P6677900','Black Ink Jet Cartridge','Connex',44,'',25.69);

INSERT INTO product
	(ProdNo, ProdName, ProdMfg, ProdQOH, ProdNextShipDate, ProdPrice)
	VALUES ('P9995676','Battery Back-up System','Cybercx',12,'02/01/2013',89.00);

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O1116324','01/23/2013','C0954327','E8544399','Sheri Gordon','336 Hill St.','Littleton','CO','80129-5543');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O1231231','01/23/2013','C9432910','E9954302','Larry Styles','9825 S. Crest Lane','Bellevue','WA','98104-2211');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O1241518','01/23/2013','C9549302','','Todd Hayes','1400 NW 88th','Lynnwood','WA','98036-2244');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O1455122','01/09/2013','C8574932','E9345771','Wally Jones','411 Webber Ave.','Seattle','WA','98105-1093');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O1579999','01/05/2013','C9543029','E8544399','Tom Johnson','1632 Ocean Dr.','Des Moines','WA','98222-1123');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O1615141','01/23/2013','C8654390','E8544399','Candy Kendall','456 Pine St.','Seattle','WA','98105-3345');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O1656777','02/11/2013','C8543321','','Ron Thompson','789 122nd St.','Renton','WA','98666-1289');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O2233457','01/12/2013','C2388597','E9884325','Beth Taylor','2396 Rafter Rd','Seattle','WA','98103-1121');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O2334661','01/14/2013','C0954327','E1329594','Mrs. Ruth Gordon','233 S. 166th','Seattle','WA','98011');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O3252629','01/23/2013','C9403348','E9954302','Mike Boren','642 Crest Ave.','Englewood','CO','80113-5431');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O3331222','01/13/2013','C1010398','','Jim Glussman','1432 E. Ravenna','Denver','CO','80111-0033');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O3377543','01/15/2013','C9128574','E8843211','Jerry Wyatt','16212 123rd Ct.','Denver','CO','80222-0022');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O4714645','01/11/2013','C2388597','E1329594','Beth Taylor','2396 Rafter Rd','Seattle','WA','98103-1121');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O5511365','01/22/2013','C3340959','E9884325','Betty White','4334 153rd NW','Seattle','WA','98178-3311');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O6565656','01/20/2013','C9865874','E8843211','Mr. Jack Sibley','166 E. 344th','Renton','WA','98006-5543');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O7847172','01/23/2013','C9943201','','Harry Sanders','1280 S. Hill Rd.','Fife','WA','98222-2258');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O7959898','02/19/2013','C8543321','E8544399','Ron Thompson','789 122nd St.','Renton','WA','98666-1289');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O7989497','01/16/2013','C3499503','E9345771','Bob Mann','1190 Lorraine Cir.','Monroe','WA','98013-1095');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O8979495','01/23/2013','C9865874','','HelenSibley','206 McCaffrey','Renton','WA','98006-5543');

INSERT INTO ordertbl
	(OrdNo, OrdDate, ClientNo, EmpNo, OrdName, OrdStreet, OrdCity,
 	OrdState, OrdZip)
	VALUES ('O9919699','02/11/2013','C9857432','E9954302','Homer Wells','123 Main St.','Seattle','WA','98105-4322');

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1116324','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1231231','P0036566',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1231231','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1241518','P0036577',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1455122','P4200344',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1579999','P1556678',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1579999','P6677900',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1579999','P9995676',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1615141','P0036566',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1615141','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1615141','P4200344',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1656777','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O1656777','P1556678',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O2233457','P0036577',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O2233457','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O2334661','P0036566',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O2334661','P1412138',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O2334661','P1556678',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O3252629','P4200344',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O3252629','P9995676',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O3331222','P1412138',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O3331222','P1556678',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O3331222','P3455443',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O3377543','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O3377543','P9995676',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O4714645','P0036566',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O4714645','P9995676',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O5511365','P1412138',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O5511365','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O5511365','P1556678',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O5511365','P3455443',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O5511365','P6677900',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O6565656','P0036566',10);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7847172','P1556678',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7847172','P6677900',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7959898','P1412138',5);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7959898','P1556678',5);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7959898','P3455443',5);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7959898','P6677900',5);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7989497','P1114590',2);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7989497','P1412138',2);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O7989497','P1445671',3);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O8979495','P1114590',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O8979495','P1412138',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O8979495','P1445671',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O9919699','P0036577',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O9919699','P1114590',1);

INSERT INTO ordline
	(OrdNo, ProdNo, Qty)
	VALUES('O9919699','P4200344',1);

commit;