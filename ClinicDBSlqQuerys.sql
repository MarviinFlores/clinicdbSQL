-- Create a new table called 'Patient' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Patient', 'U') IS NOT NULL
DROP TABLE dbo.Patient
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Patient
(
    PatientXKey [NVARCHAR](20) NOT NULL PRIMARY KEY, -- primary key column
    Names [NVARCHAR](50) NOT NULL,
    LastNames [NVARCHAR](50) NOT NULL,
    Age [INT] NOT NULL,
    BirthDay DATE NOT NULL,
    Adress [NVARCHAR](50) NOT NULL,
    
);
GO

-- Create a new table called 'MedicalSpeciality' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.MedicalSpeciality', 'U') IS NOT NULL
DROP TABLE dbo.MedicalSpeciality
GO
-- Create the table in the specified schema
CREATE TABLE dbo.MedicalSpeciality
(
    Medical_SpecialityXKey INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- primary key column
    DescriptionSpec [NVARCHAR](50) NOT NULL,   
    
);
GO
-- Create a new table called 'Doctor' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Doctor', 'U') IS NOT NULL
DROP TABLE dbo.Doctor
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Doctor
(
    DoctorXKey [NVARCHAR](20) NOT NULL PRIMARY KEY, -- primary key column
    Names [NVARCHAR](50) NOT NULL,
    LastNames [NVARCHAR](50) NOT NULL,
    Suitability [NVARCHAR](20) NOT NULL,
    Medical_SpecialityXKey INT NOT NULL, 
    CONSTRAINT fk_Doc_MedSpec FOREIGN KEY (Medical_SpecialityXKey) REFERENCES MedicalSpeciality(Medical_SpecialityXKey)


    
);
GO
-- Create a new table called 'AttentionSchedule' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.AttentionSchedule', 'U') IS NOT NULL
DROP TABLE dbo.AttentionSchedule
GO
-- Create the table in the specified schema
CREATE TABLE dbo.AttentionSchedule
(
    Attention_ScheduleXKey INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- primary key column
    Start_Time TIME NOT NULL,
    End_Time TIME NOT NULL,
    Schedule_Quota INT NOT NULL
    
);
GO
-- Create a new table called 'DaysxAttention' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.DaysxAttention', 'U') IS NOT NULL
DROP TABLE dbo.DaysxAttention
GO
-- Create the table in the specified schema
CREATE TABLE dbo.DaysxAttention
(
     -- primary key column
    Attention_Date DATE NOT NULL,
    DoctorXKey [NVARCHAR](20)  NOT NULL,
    Attention_ScheduleXKey INT NOT NULL,
    CONSTRAINT fk_Shed_DayAttn FOREIGN KEY (Attention_ScheduleXKey) REFERENCES AttentionSchedule(Attention_ScheduleXKey)
    

    -- specify more columns here
);
GO

-- Create a new table called 'Medical_Appointment' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Medical_Appointment', 'U') IS NOT NULL
DROP TABLE dbo.Medical_Appointment
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Medical_Appointment
(
    Medical_AppointmentXKey INT NOT NULL PRIMARY KEY, -- primary key column
    PatientXKey [NVARCHAR](20) NOT NULL,
    DoctorXKey [NVARCHAR](20)  NOT NULL,
    Medical_SpecialityXKey INT NOT NULL,
    Attention_ScheduleXKey INT NOT NULL,
    Appointment_Date DATETIME NOT NULL,
    Urgency_Appointment [NVARCHAR](50) NOT NULL,

    -- specify more columns here
);
GO


-- Create a new table called 'Patient_Visit' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Patient_Visit', 'U') IS NOT NULL
DROP TABLE dbo.Patient_Visit
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Patient_Visit
(
    Patient_VisitXKey INT NOT NULL PRIMARY KEY IDENTITY (1,1), -- primary key column
    PatientXKey [NVARCHAR](20) NOT NULL,
    DoctorXKey  [NVARCHAR](20) NOT NULL,
    Attention_ScheduleXKey  INT NOT NULL,
    Medical_AppointmentXKey INT NOT NULL,
    Visit_Date  DATETIME NOT NULL,
    Urgency_Visit [VARCHAR](50) NOT NULL,
    CONSTRAINT fk_Pat_Vist FOREIGN KEY (PatientXKey) REFERENCES Patient(PatientXKey)

    -- specify more columns here
);
GO
-- Create a new table called 'Allergies' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Allergies', 'U') IS NOT NULL
DROP TABLE dbo.Allergies
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Allergies
(
    --AllergiesId INT NOT NULL PRIMARY KEY, -- primary key column
    PatientXKey [NVARCHAR](20) NOT NULL,
    AllergyName [NVARCHAR](50) NOT NULL,
    DiagnosisDate DATE NOT NULL,
    CONSTRAINT fk_Pat_Aler FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)

    
);
GO

-- Create a new table called 'Vaccines' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Vaccines', 'U') IS NOT NULL
DROP TABLE dbo.Vaccines
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Vaccines
(
    --VaccinesId INT NOT NULL PRIMARY KEY, -- primary key column
    PatientXKey [NVARCHAR](20) NOT NULL,
    VaccinesName [NVARCHAR](50) NOT NULL,
    Application_Date DATE NOT NULL,
    Vaccine_Booster_Date DATE NOT NULL,
    CONSTRAINT fk_Pat_Vacc FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)    
);
GO

-- Create a new table called 'BloodPressure' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.BloodPressure', 'U') IS NOT NULL
DROP TABLE dbo.BloodPressure
GO
-- Create the table in the specified schema
CREATE TABLE dbo.BloodPressure
(
    --BloodPressureId INT NOT NULL PRIMARY KEY, -- primary key column
      PatientXKey [NVARCHAR](20) NOT NULL,
      Date_BloodPress DATE NOT NULL,
      Systolic_Press INT NOT NULL,
      Diastolic_Press INT NOT NULL,
      Pulse INT NOT NULL,
      Status_BloodPress [NVARCHAR](15),
      CONSTRAINT fk_Pat_BloodP FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)              
    
);
GO

-- Create a new table called 'SugarLevel' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.SugarLevel', 'U') IS NOT NULL
DROP TABLE dbo.SugarLevel
GO
---- Create the table in the specified schema
CREATE TABLE dbo.SugarLevel
(
  --SugarLevelId INT NOT NULL PRIMARY KEY, -- primary key column
     PatientXKey [NVARCHAR](20) NOT NULL,
     Date_SugarLevel DATE NOT NULL,    
     Sugar_Level INT NOT NULL,
     Sugar_Level_Status [NVARCHAR](20) NOT NULL,
     CONSTRAINT fk_Pat_SugLvl FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)                  
);
GO
-- Create a new table called 'Recipes' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Recipes', 'U') IS NOT NULL
DROP TABLE dbo.Recipes
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Recipes
(
    RecipesXKey INT NOT NULL PRIMARY KEY IDENTITY(1,1), -- primary key column
    DoctorXKey [NVARCHAR](20) NOT NULL,
    PatientXKey [NVARCHAR](20) NOT NULL,
    Medicine_Name[NVARCHAR](50) NOT NULL,
    Treatment_Dose [NVARCHAR](50) NOT NULL,
     CONSTRAINT fk_Pat_Recip FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)                  
    
);
GO

-- Create a new table called 'Diagnosis' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Diagnosis', 'U') IS NOT NULL
DROP TABLE dbo.Diagnosis
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Diagnosis
(
    --DiagnosisId INT NOT NULL PRIMARY KEY, -- primary key column
     PatientXKey [NVARCHAR](20) NOT NULL,
     DoctorXKey [NVARCHAR](20) NOT NULL,
     Patient_VisitXKey INT NOT NULL,
     Physical_Diagnosis_Exam [NVARCHAR](50) NOT  NULL,
     Diagnosis_Description [NVARCHAR](60) NOT NULL,
     CONSTRAINT fk_Pat_Diagn FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)                  
    
    
);
GO  


-- Create a new table called 'Laboratory_Test' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Laboratory_Test', 'U') IS NOT NULL
DROP TABLE dbo.Laboratory_Test
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Laboratory_Test
(
    --Laboratory_TestId INT NOT NULL PRIMARY KEY, -- primary key column
     PatientXKey [NVARCHAR](20) NOT NULL,
     DoctorXKey [NVARCHAR](20) NOT NULL,
     Lab_Date DATE NOT NULL,
     Lab_Name [VARCHAR](30) NOT NULL,
     Lab_Values INT NOT NULL,
     Lab_Diagnosis [VARCHAR](50) NOT NULL,
     CONSTRAINT fk_Pat_Lab FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)                       
);
GO

-- Create a new table called 'Radiology_Test' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Radiology_Test', 'U') IS NOT NULL
DROP TABLE dbo.Radiology_Test
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Radiology_Test
(
  --  Radiology_TestId INT NOT NULL PRIMARY KEY, -- primary key columns
     PatientXKey [NVARCHAR](20) NOT NULL,
     DoctorXKey [NVARCHAR](20) NOT NULL,
     Xray_Date DATE NOT NULL,
     Xray_Name [VARCHAR](30) NOT NULL,
     Lab_Values INT NOT NULL,
     Lab_Diagnosis [VARCHAR](50) NOT NULL,
     CONSTRAINT fk_Pat_Xry FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)                       
  
    -- specify more columns here
);
GO
-- Create a new table called 'Patient_Pathology' in schema 'dbo'
-- Drop the table if it already exists
IF OBJECT_ID('dbo.Patient_Pathology', 'U') IS NOT NULL
DROP TABLE dbo.Patient_Pathology
GO
-- Create the table in the specified schema
CREATE TABLE dbo.Patient_Pathology
(
    --PathologyId INT NOT NULL PRIMARY KEY, -- primary key column
   PatientXKey [NVARCHAR](20) NOT NULL,
   Pathology_Date DATE,
   Pathology_Name [NVARCHAR](30)  NOT NULL,
   CONSTRAINT fk_Pat_Path FOREIGN KEY (PatientXKey)  REFERENCES Patient(PatientXKey)                       

  
    
  
);
GO