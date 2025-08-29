<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportSubjectsByTeacher.aspx.cs" Inherits="SchoolManagementSystem.ReportSubjectsByTeacher" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Subjects by Teacher</title>
    <link href="Style/custom-style.css" rel="stylesheet" type="text/css" />
    <style>
        .form-container {
            background-color: #fff;
            padding: 30px;
            max-width: 600px;
            margin: 50px auto;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: left;
        }

        .form-container h2 {
            color: #2a4d69;
            text-align: center;
            margin-bottom: 25px;
        }

        .form-container label,
        .form-container select,
        .form-container .asp-button {
            display: block;
            width: 100%;
            margin-bottom: 20px;
        }

        .form-container select {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1em;
        }

        .asp-button {
            background-color: #4a90e2;
            color: white;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-size: 1em;
            font-weight: bold;
            cursor: pointer;
        }

        .asp-button:hover {
            background-color: #357ABD;
        }

        .styled-gridview {
            margin-top: 20px;
            width: 100%;
            border-collapse: collapse;
        }

        .styled-gridview th,
        .styled-gridview td {
            padding: 10px;
            border: 1px solid #ccc;
            text-align: center;
        }

        .styled-gridview th {
            background-color: #e3effd;
            color: #2a4d69;
        }

        .main-footer {
            text-align: center;
            margin-top: 40px;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="main-header">
            <h1>📘 School Management System</h1>
        </header>

        <div class="form-container">
            <h2>📚 Subjects Taught by a Teacher</h2>

            <label for="ddlTeachers">Select a Teacher:</label>
            <asp:DropDownList ID="ddlTeachers" runat="server" CssClass="form-control" />

            <asp:Button ID="btnSearch" runat="server" Text="📋 Show Subjects" CssClass="asp-button" OnClick="btnSearch_Click" />

            <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="true" CssClass="styled-gridview" />
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
