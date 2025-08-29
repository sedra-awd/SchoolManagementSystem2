<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportStudentsByAddress.aspx.cs" Inherits="SchoolManagementSystem.ReportStudentsByAddress" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Students by Address</title>
    <link href="Style/custom-style.css" rel="stylesheet" type="text/css" />
    <style>
        .form-container {
            background-color: #fff;
            padding: 30px;
            max-width: 500px;
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
        .form-container input,
        .form-container .asp-button {
            display: block;
            width: 100%;
            margin-bottom: 20px;
        }

        .form-container input {
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

        .result-label {
            text-align: center;
            font-size: 1.2em;
            margin-top: 20px;
            color: #2a4d69;
            font-weight: bold;
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
            <h2>🔍 Students by Address</h2>

            <label for="txtAddress">Enter Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" />

            <asp:Button ID="btnSearch" runat="server" Text="🔍 Search" CssClass="asp-button" OnClick="btnSearch_Click" />

            <asp:Label ID="lblResult" runat="server" CssClass="result-label" />
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
