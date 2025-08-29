<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageClasses.aspx.cs" Inherits="SchoolManagementSystem.ManageClasses" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Manage Classes</title>
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

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-family: Arial, sans-serif;
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

        .gridview a {
            padding: 6px 12px;
            margin: 2px;
            text-decoration: none;
            color: white;
            background-color: #4a90e2;
            border-radius: 4px;
            font-size: 0.9em;
        }

        .gridview a:hover {
            background-color: #357ABD;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="main-header">
                <h1>🏫 Manage Classes</h1>
            </header>

            <div class="actions">
                <a href="AddClass.aspx">➕ Add New Class</a>
            </div>

            <div class="gridview-container">
                <asp:GridView ID="gvClasses" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    DataKeyNames="id"
                    OnRowEditing="gvClasses_RowEditing"
                    OnRowUpdating="gvClasses_RowUpdating"
                    OnRowCancelingEdit="gvClasses_RowCancelingEdit"
                    OnRowDeleting="gvClasses_RowDeleting">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                        <asp:BoundField DataField="name" HeaderText="Class Name" />
                        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
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
