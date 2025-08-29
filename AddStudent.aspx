<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="SchoolManagementSystem.AddStudent" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Add New Student</title>
    <link href="Styles/custom-style.css" rel="stylesheet" type="text/css" />
    <style>
        .form-container {
            background-color: #fff;
            padding: 30px;
            max-width: 600px;
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

        .form-container .message {
            text-align: center;
            font-weight: bold;
            color: green;
        }

        .back-link {
            text-align: center;
            margin-top: 20px;
        }

        .back-link a {
            text-decoration: none;
            color: #4a90e2;
            font-weight: bold;
            font-size: 1em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <header class="main-header">
            <h1>📘 School Management System</h1>
        </header>

        <div class="form-container">
            <h2>Add New Student</h2>

            <label for="txtFirstName">First Name:</label>
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" />

            <label for="txtLastName">Last Name:</label>
            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" />

            <label for="txtFatherName">Father Name:</label>
            <asp:TextBox ID="txtFatherName" runat="server" CssClass="form-control" />

            <label for="txtMotherName">Mother Name:</label>
            <asp:TextBox ID="txtMotherName" runat="server" CssClass="form-control" />

            <label for="txtBirthDate">Birth Date:</label>
            <asp:TextBox ID="txtBirthDate" runat="server" TextMode="Date" CssClass="form-control" />

            <label for="txtAddress">Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />

            <label for="ddlClasses">Class:</label>
            <asp:DropDownList ID="ddlClasses" runat="server" CssClass="form-control" />

            <asp:Button ID="btnAdd" runat="server" Text="➕ Add Student" CssClass="asp-button" OnClick="btnAdd_Click" />

            <asp:Label ID="lblMsg" runat="server" CssClass="message" />

            <div class="back-link">
                <a href="ManageStudents.aspx">🔙 Back to Manage Students</a>
            </div>
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
