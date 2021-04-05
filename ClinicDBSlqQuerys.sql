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