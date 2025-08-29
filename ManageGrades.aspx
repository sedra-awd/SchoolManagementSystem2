<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageGrades.aspx.cs" Inherits="YourProjectNamespace.ManageGrades" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Manage Grades</title>
    <link href="Style/custom-style.css" rel="stylesheet" type="text/css" />
    <style>
        .container {
            width: 90%;
            max-width: 1000px;
            margin: 0 auto;
            padding-top: 40px;
            text-align: center;
        }

        .container h2 {
            color: #2a4d69;
            margin-bottom: 30px;
        }

        .gridview-container {
            text-align: left;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th, .gridview td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        .gridview th {
            background-color: #f2f2f2;
            color: #2a4d69;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: #e6f0fa;
        }

        .message-label {
            margin-top: 20px;
            font-weight: bold;
            color: green;
        }

        .main-footer {
            margin-top: 50px;
            padding: 15px;
            background-color: #f2f2f2;
            text-align: center;
            font-size: 14px;
            color: #666;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="main-header">
                <h2>📊 Manage Student Grades</h2>
            </header>

            <div class="gridview-container">
                <asp:GridView ID="gvGrades" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    DataKeyNames="id"
                    OnRowEditing="gvGrades_RowEditing"
                    OnRowUpdating="gvGrades_RowUpdating"
                    OnRowCancelingEdit="gvGrades_RowCancelingEdit"
                    OnRowDeleting="gvGrades_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="student_name" HeaderText="Student" ReadOnly="True" />
                        <asp:BoundField DataField="subject_name" HeaderText="Subject" ReadOnly="True" />
                        <asp:BoundField DataField="mark" HeaderText="Grade" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                    </Columns>
                </asp:GridView>
            </div>

            <asp:Label ID="lblMsg" runat="server" CssClass="message-label" />
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
