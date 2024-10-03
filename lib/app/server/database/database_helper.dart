import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  // static final DatabaseHelper instance = DatabaseHelper._init();
  // static Database? _database;

  //   DatabaseHelper._init();
  //     Future<Database> get database async {
  //   if (_database != null) return _database!;
  //   _database = await _initDB('app.db');
  //   return _database!;
  // }

  //  Future<Database> _initDB(String filePath) async {
  //   final dbPath = await getDatabasesPath();
  //   final path = join(dbPath, filePath);
  //   print("FILE PATH: $path");

  //   return await openDatabase(path, version: 1, onCreate: _createDB,onUpgrade: _upgradeDB);
  // }
  static DatabaseHelper? _databaseManger;
  static late Database _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseManger ??= DatabaseHelper._createInstance();
    return _databaseManger!;
  }

  Future<DatabaseHelper> initialize() async {
    _database = await initializeDatabase('app.db');
    return this;
  }

  Future<Database> initializeDatabase(String filePath) async {
    var databasesPath = await getDatabasesPath();
    String path = p.join(databasesPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }
 // old emplotee table
  static const String detailedEmployeeTable = '''
   CREATE TABLE DetailedEmployee (
      TenentID               INTEGER        NOT NULL,
      LocationID             INTEGER        NOT NULL
                                          DEFAULT 1,
      employeeID             INTEGER        NOT NULL,
      ContractType           NVARCHAR (50)  COLLATE NOCASE,
      PFID                   NVARCHAR (20)  COLLATE NOCASE,
      SubscribedDate         DATETIME,
      AgreedSubAmount        NUMERIC,
      KUEmployee             BIT            DEFAULT 1,
      OnSickLeave            BIT            DEFAULT 0,
      MemberOfFund           BIT            DEFAULT 0,
      ReSubscribed           DATETIME,
      EmployeeType           NVARCHAR (20)  COLLATE NOCASE
                                          DEFAULT '1',
      ArabicName             NVARCHAR (200) COLLATE NOCASE,
      EnglishName            NVARCHAR (200) COLLATE NOCASE,
      job_title_code         INTEGER        DEFAULT 1,
      job_title_Name         NVARCHAR (200) COLLATE NOCASE,
      Department             INTEGER,
      Department_Name        NVARCHAR (200) COLLATE NOCASE,
      emp_gender             SMALLINT,
      emp_birthday           DATETIME       COLLATE NOCASE,
      emp_marital_status     NVARCHAR (20)  COLLATE NOCASE,
      salary                 NUMERIC,
      emp_work_telephone     NVARCHAR (50)  COLLATE NOCASE
                                          DEFAULT 1,
      emp_work_email         NVARCHAR (50)  COLLATE NOCASE
                                          DEFAULT 1,
      MobileNumber           NVARCHAR (15)  COLLATE NOCASE,
      TerminationBanned      BIT            DEFAULT 0,
      HoldQty                NUMERIC,
      HoldRemarks            NVARCHAR (200) COLLATE NOCASE,
      UnHoldDate             DATETIME       COLLATE NOCASE,
      UnHoldBy               NVARCHAR (10)  COLLATE NOCASE,
      Next2KinName           NVARCHAR (200) COLLATE NOCASE,
      Next2KinMobNumber      NVARCHAR (15)  COLLATE NOCASE,
      nation_code            INTEGER        DEFAULT 126,
      nation_Name            NVARCHAR (200) COLLATE NOCASE,
      emp_cid_num            NVARCHAR       COLLATE NOCASE
                                          DEFAULT 1,
      emp_paci_num           NVARCHAR (100) COLLATE NOCASE
                                          DEFAULT 1,
      emp_other_id           NVARCHAR (100) COLLATE NOCASE
                                          DEFAULT 1,
      Subscription_status    INTEGER        DEFAULT 1,
      LastSubRecDate         DATETIME,
      EmpStatus              INTEGER        DEFAULT 1,
      SubFrozen              BIT            DEFAULT 0,
      SubFrozenDate          DATETIME,
      joined_date            DATETIME,
      End_date               DATETIME,
      SettlementSerMonths    INTEGER,
      SettlementAmount       NUMERIC,
      NextSetlementPayDate   DATETIME       COLLATE NOCASE,
      NextSetlementPayAmount NUMERIC,
      subscription_date      DATETIME,
      ReSubscriped_date      DATETIME,
      LoanAct                NVARCHAR (50)  COLLATE NOCASE,
      LoanAmount             NUMERIC,
      HajjAct                NVARCHAR (50)  COLLATE NOCASE,
      HajjActAmount          NUMERIC,
      PersLoanAct            NVARCHAR (50)  COLLATE NOCASE,
      PersLoanAmount         NUMERIC,
      ConsumerLoanAct        NVARCHAR (50)  COLLATE NOCASE,
      ConsumerLoanAmount     NUMERIC,
      OtherAct1              NVARCHAR (50)  COLLATE NOCASE,
      OtherAct2              NVARCHAR (50)  COLLATE NOCASE,
      OtherAct3              NVARCHAR (50)  COLLATE NOCASE,
      OtherAct4              NVARCHAR (50)  COLLATE NOCASE,
      OtherAct5              NVARCHAR (50)  COLLATE NOCASE,
      Membership             NVARCHAR (150) COLLATE NOCASE,
      MembershipJoiningDate  DATETIME,
      termination_id         INTEGER,
      Termination            NVARCHAR (150) COLLATE NOCASE,
      TerminationDate        DATETIME,
      FirstTermination_id    INTEGER,
      FirstTTermination      NVARCHAR (150) COLLATE NOCASE,
      FirstTTerminationDate  DATETIME,
      emp_street1            NVARCHAR (100) COLLATE NOCASE
                                          DEFAULT 1,
      emp_street2            NVARCHAR (100) COLLATE NOCASE
                                          DEFAULT 1,
      city_code              NVARCHAR (50)  COLLATE NOCASE
                                          DEFAULT 1,
      coun_code              INTEGER        DEFAULT 1,
      Remarks                NVARCHAR (500) COLLATE NOCASE,
      userID                 NVARCHAR (100) COLLATE NOCASE,
      ActiveDirectoryID      NVARCHAR (100) COLLATE NOCASE,
      MainHRRoleID           INTEGER,
      EmployeeLoginID        NVARCHAR (100) COLLATE NOCASE,
      EmployeePassword       NVARCHAR (150) COLLATE NOCASE,
      Active                 BIT,
      Deleted                BIT,
      DateTime               DATETIME       DEFAULT (CURRENT_TIMESTAMP),
      DeviceID               NVARCHAR (50)  COLLATE NOCASE
                                          DEFAULT 0,
      ImageUrl               NVARCHAR       COLLATE NOCASE,
      IsKUEmployee           BIT,
      IsOnSickLeave          BIT            NOT NULL
                                          DEFAULT 0,
      IsMemberOfFund         BIT            NOT NULL
                                          DEFAULT 0,
      SubOPAmount            NUMERIC,
      SubOPNotPaidAmount     NUMERIC,
      LoanOPAmount           NUMERIC,
      LoanOPNotPaidAmount    NUMERIC,
      CRUP_ID                INTEGER,
      UploadDate             DATETIME,
      Uploadby               NVARCHAR (50)  COLLATE NOCASE,
      SyncDate               DATETIME,
      Syncby                 NVARCHAR (50)  COLLATE NOCASE,
      SynID                  INTEGER,
      RejectedBy             VARCHAR (100)  COLLATE NOCASE,
      Rejecteddate           DATETIME       COLLATE NOCASE,
      PRIMARY KEY (
        TenentID,
        LocationID,
        employeeID
      )
    )
''';

  Future<void> _createDB(Database db, int version) async {
  try {
    await db.execute(detailedEmployeeTable);
    print("Table 'DetailedEmployee' created successfully.");
  } catch (e) {
    print("Error creating 'DetailedEmployee' table: $e");
  }
}


  // Upgrade database schema from version 1 to 2, adding new columns
  Future _upgradeDB(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      await addNewColums(db);
    }
  }

//  TODO REMOVE AFTER TESTING
  Future<void> addNewColums(Database db) async {}

  Future<int> insertData(Map<String, dynamic> data) async {
    final db = _database;
    // Check if the entry already exists
    final List<Map<String, dynamic>> existingEmployeeDetails = await db.query(
      'DetailedEmployee',
      where: 'employeeID = ?',
      whereArgs: [data['employeeID']],
    );
    if (existingEmployeeDetails.isNotEmpty) {
      print("Entry already exists.");
      return -1; // Indicate that the entry already exists
    }

    return await db.insert('DetailedEmployee', data);
  }
  
  
  Future<int> updateData(Map<String, dynamic> data) async {
    final db = _database.database;

    return await db.update(
      'DetailedEmployee',
      data,
      where: 'employeeID = ?',
      whereArgs: [data['employeeID']],
    );
  }

  Future<List<Map<String, dynamic>>> getData() async {
    final db = _database;
    return await db.query('DetailedEmployee');
  }

  Future close() async {
    final db = _database;
    db.close();
  }

}