<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddGrade.aspx.cs" Inherits="SchoolManagementSystem.AddGrade" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Add Grade</title>
    <link href="Style/custom-style.css" rel="stylesheet" type="text/css" />
    <style>
        .form-container {
            background-color: #fff;
            padding: 30px;
            max-width: 500px;
            margin: 40px auto;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: left;
        }

        .form-container h2 {
            color: #2a4d69;
            text-align: center;
            margin-bottom: 30px;
        }

        .form-container label,
        .form-container select,
        .form-container input,
        .form-container .asp-button {
            display: block;
            width: 100%;
            margin-bottom: 20px;
        }

        .form-container input,
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

        .form-container .message {
            text-align: center;
            font-weight: bold;
            color: green;
        }

        .back-button {
            display: block;
            text-align: center;
            margin-top: 30px;
        }

        .back-button a {
            text-decoration: none;
            background-color: #2a4d69;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            transition: background-color 0.3s ease;
        }

        .back-button a:hover {
            background-color: #1c3551;
        }

        .main-footer {
            margin-top: 40px;
            text-align: center;
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
            <h2>Add Student Grade</h2>

            <label for="ddlStudents">Student:</label>
            <asp:DropDownList ID="ddlStudents" runat="server" CssClass="form-control" />

            <label for="ddlSubjects">Subject:</label>
            <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="form-control" />

            <label for="txtGrade">Grade:</label>
            <asp:TextBox ID="txtGrade" runat="server" CssClass="form-control" />

            <asp:Button ID="btnAdd" runat="server" Text="➕ Add Grade" CssClass="asp-button" OnClick="btnAdd_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="message" />
        </div>

        <div class="back-button">
            <a href="ManageGrades.aspx">🔙 Back to Manage Grades</a>
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
