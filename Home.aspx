<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SchoolManagementSystem.Home" %>

<!DOCTYPE html>
<html>
<head>
    <link href="Styles/custom-style.css" rel="stylesheet" type="text/css" />
    <meta charset="utf-8" />
    <title>School Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            padding: 50px 0;
            margin: 0;
            text-align: center;
        }

        h2 {
            color: #2a4d69;
            font-size: 2em;
            margin-bottom: 30px;
        }

        .menu {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(260px, 1fr));
            gap: 20px;
            width: 90%;
            max-width: 1100px;
            margin: 0 auto;
        }

        .menu-group {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: transform 0.2s ease;
        }

        .menu-group:hover {
            transform: translateY(-4px);
        }

        .menu-main {
            width: 100%;
            padding: 14px 0;
            font-size: 1.2em;
            background-color: #2a4d69;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .submenu {
            display: none;
            animation: fadeIn 0.3s ease-in-out;
        }

        .submenu a {
            display: block;
            margin: 8px 0;
            padding: 10px 15px;
            background-color: #4a90e2;
            color: white;
            border-radius: 6px;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .submenu a:hover {
            background-color: #357ABD;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-10px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
    <script>
        function toggleSub(button) {
            const submenu = button.nextElementSibling;
            submenu.style.display = submenu.style.display === "block" ? "none" : "block";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="main-header">
    <h1>📘 School Management System</h1>
       </header>
      
        <div class="menu">

            <div class="menu-group">
                <button type="button" class="menu-main" onclick="toggleSub(this)">👨‍🎓 Students</button>
                <div class="submenu">
                    <a href="AddStudent.aspx">➕ Add Student</a>
                    <a href="ManageStudents.aspx">🗂 Manage Students</a>
                </div>
            </div>

            <div class="menu-group">
                <button type="button" class="menu-main" onclick="toggleSub(this)">👩‍🏫 Teachers</button>
                <div class="submenu">
                    <a href="AddTeacher.aspx">➕ Add Teacher</a>
                    <a href="ManageTeachers.aspx">🗂 Manage Teachers</a>
                </div>
            </div>

            <div class="menu-group">
                <button type="button" class="menu-main" onclick="toggleSub(this)">📚 Subjects</button>
                <div class="submenu">
                    <a href="AddSubject.aspx">➕ Add Subject</a>
                    <a href="ManageSubjects.aspx">🗂 Manage Subjects</a>
                </div>
            </div>

            <div class="menu-group">
                <button type="button" class="menu-main" onclick="toggleSub(this)">📝 Grades</button>
                <div class="submenu">
                    <a href="AddGrade.aspx">➕ Add Grade</a>
                    <a href="ManageGrades.aspx">🗂 Manage Grades</a>
                </div>
            </div>

            <div class="menu-group">
                <button type="button" class="menu-main" onclick="toggleSub(this)">🏫 Classes</button>
                <div class="submenu">
                    <a href="AddClass.aspx">➕ Add Class</a>
                    <a href="ManageClasses.aspx">🗂 Manage Classes</a>
                </div>
            </div>

            <div class="menu-group">
                <button type="button" class="menu-main" onclick="toggleSub(this)">📊 Reports</button>
                <div class="submenu">
                    <a href="ReportStudentsByAddress.aspx">📍 Students by Address</a>
                    <a href="ReportSubjectsByTeacher.aspx">👨‍🏫 Subjects by Teacher</a>
                    <a href="ReportGradesByClassAndSubject.aspx">📄 Grades by Class and Subject</a>
                </div>
            </div>

        </div>
        <footer class="main-footer">
          <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
      </footer>

    </form>
</body>
</html>
