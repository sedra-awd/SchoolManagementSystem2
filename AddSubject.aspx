<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSubject.aspx.cs" Inherits="SchoolManagementSystem.AddSubject" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Add Subject</title>
    <link href="Styles/custom-style.css" rel="stylesheet" type="text/css" />
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
        .form-container input,
        .form-container select,
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

        .back-link {
            display: inline-block;
            text-align: center;
            margin: 20px auto;
            text-decoration: none;
            background-color: #2a4d69;
            color: white;
            padding: 10px 20px;
            border-radius: 6px;
            font-weight: bold;
        }

        .form-container .message {
            text-align: center;
            font-weight: bold;
            color: green;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="main-header">
            <h1>📘 School Management System</h1>
        </header>

        <div class="form-container">
            <h2>Add New Subject</h2>

            <label for="txtSubjectName">Subject Name:</label>
            <asp:TextBox ID="txtSubjectName" runat="server" CssClass="form-control" />

            <label for="txtPassedGrade">Passed Grade:</label>
            <asp:TextBox ID="txtPassedGrade" runat="server" CssClass="form-control" />

            <label for="ddlTeachers">Teacher:</label>
            <asp:DropDownList ID="ddlTeachers" runat="server" CssClass="form-control" />

            <asp:Button ID="btnAdd" runat="server" Text="➕ Add Subject" CssClass="asp-button" OnClick="btnAdd_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="message" />
        </div>

        <div style="text-align:center;">
            <a href="ManageSubjects.aspx" class="back-link">🔙 Back to Manage Subjects</a>
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
