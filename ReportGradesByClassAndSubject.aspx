<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReportGradesByClassAndSubject.aspx.cs" Inherits="SchoolManagementSystem.ReportGradesByClassAndSubject" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Grades by Class and Subject</title>
    <link href="Style/custom-style.css" rel="stylesheet" type="text/css" />
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
        }

        .main-header {
            background-color: #2a4d69;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

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
            width: 100%;
        }

        .asp-button:hover {
            background-color: #357ABD;
        }

        .grid-container {
            max-width: 900px;
            margin: 30px auto;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .gridview th {
            background-color: #2a4d69;
            color: white;
            padding: 12px;
            text-align: left;
        }

        .gridview td {
            padding: 10px 15px;
            border-bottom: 1px solid #ccc;
        }

        .gridview tr:hover {
            background-color: #f5f5f5;
        }

        .command-button {
            padding: 6px 12px;
            margin: 2px;
            text-decoration: none;
            color: white;
            background-color: #4a90e2;
            border-radius: 4px;
            font-size: 0.9em;
            display: inline-block;
            border: none;
            cursor: pointer;
        }

        .command-button:hover {
            background-color: #357ABD;
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
            <h2>Grades by Class and Subject</h2>

            <label for="ddlClasses">Select Class:</label>
            <asp:DropDownList ID="ddlClasses" runat="server" CssClass="form-control" />

            <label for="ddlSubjects">Select Subject:</label>
            <asp:DropDownList ID="ddlSubjects" runat="server" CssClass="form-control" />

            <asp:Button ID="btnSearch" runat="server" Text="🔍 Search" CssClass="asp-button" OnClick="btnSearch_Click" />
        </div>

        <div class="grid-container">
            <asp:GridView ID="gvGrades" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="StudentName" HeaderText="Student" />
                    <asp:BoundField DataField="Grade" HeaderText="Grade" />

                </Columns>
            </asp:GridView>
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
