<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageStudents.aspx.cs" Inherits="SchoolManagementSystem.ManageStudents" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta charset="utf-8" />
    <title>Manage Students</title>
    <link href="Styles/custom-style.css" rel="stylesheet" type="text/css" />
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
            margin-bottom: 30px;
        }

        .main-footer {
            background-color: #2a4d69;
            color: white;
            padding: 15px 0;
            margin-top: 40px;
            text-align: center;
            font-size: 0.9em;
        }

        .gridview-style {
            margin: 0 auto;
            width: 95%;
            background-color: white;
            border-collapse: collapse;
        }

        .gridview-style th, .gridview-style td {
            padding: 10px;
            border: 1px solid #ccc;
        }

        .gridview-style th {
            background-color: #2a4d69;
            color: white;
        }

        .gridview-style tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .msg-label {
            color: green;
            margin-top: 20px;
            display: block;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Manage Students</h2>

        <asp:GridView ID="gvStudents" runat="server" CssClass="gridview-style"
            AutoGenerateColumns="False" DataKeyNames="id"
            OnRowEditing="gvStudents_RowEditing"
            OnRowUpdating="gvStudents_RowUpdating"
            OnRowCancelingEdit="gvStudents_RowCancelingEdit"
            OnRowDeleting="gvStudents_RowDeleting">

            <Columns>
                <asp:BoundField DataField="id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="First_Name" HeaderText="First Name" />
                <asp:BoundField DataField="Last_Name" HeaderText="Last Name" />
                <asp:BoundField DataField="Father_Name" HeaderText="Father's Name" />
                <asp:BoundField DataField="Mother_Name" HeaderText="Mother's Name" />
                <asp:BoundField DataField="BirthDate" HeaderText="Birth Date" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="class_id" HeaderText="Class ID" />
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>

        <asp:Label ID="lblMsg" runat="server" CssClass="msg-label" />
        
        <footer class="main-footer">
                <p>&copy; 2025 - School Management System | Designed by 3Sj</p>
        </footer>
    </form>
</body>
</html>
