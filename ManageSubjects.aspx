<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSubjects.aspx.cs" Inherits="SchoolManagementSystem.ManageSubjects" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Manage Subjects</title>
    <link href="Styles/custom-style.css" rel="stylesheet" type="text/css" />
    <style>
        .container {
            width: 90%;
            max-width: 900px;
            margin: 0 auto;
            text-align: center;
            padding-top: 40px;
        }

        .actions {
            margin-bottom: 20px;
        }

        .actions a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #4a90e2;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            margin-right: 10px;
            transition: background-color 0.3s ease;
        }

        .actions a:hover {
            background-color: #357ABD;
        }

        .gridview-container {
            margin-top: 20px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th,
        .gridview td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        .gridview th {
            background-color: #2a4d69;
            color: white;
        }

        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .gridview tr:hover {
            background-color: #e6f0fa;
        }

        .main-footer {
            background-color: #2a4d69;
            color: white;
            padding: 15px 0;
            margin-top: 50px;
            text-align: center;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="main-header">
                <h1>📚 Manage Subjects</h1>
            </header>

            <div class="actions">
                <a href="AddSubject.aspx">➕ Add New Subject</a>
            </div>

            <div class="gridview-container">
                <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    DataKeyNames="id"
                    OnRowEditing="gvSubjects_RowEditing"
                    OnRowUpdating="gvSubjects_RowUpdating"
                    OnRowCancelingEdit="gvSubjects_RowCancelingEdit"
                    OnRowDeleting="gvSubjects_RowDeleting">

                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="name" HeaderText="Subject Name" />
                        <asp:BoundField DataField="passed_grade" HeaderText="Passed Grade" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                        <asp:BoundField DataField="TeacherName" HeaderText="Teacher" />
                    </Columns>
                </asp:GridView>
            </div>

            <br />
            <asp:Label ID="lblMsg" runat="server" ForeColor="Green" />
        </div>

        <footer class="main-footer">
            <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
