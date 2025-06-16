<%@ Page Title="" Language="C#" MasterPageFile="~/gdien.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BanLaptop.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Trang chủ</h2>

    <!-- Chọn ngôn ngữ -->
    <asp:Label ID="lblPrompt" runat="server" Text="Chọn ngôn ngữ: "></asp:Label>
    <asp:DropDownList ID="ddlLanguages" runat="server">
        <asp:ListItem Text="Tiếng Anh" Value="an" />
        <asp:ListItem Text="Tiếng Việt" Value="vi" />
        <asp:ListItem Text="Tiếng Trung" Value="ch" />
    </asp:DropDownList>
    <br /><br />

    <!-- Chọn giới tính -->
    <asp:Label ID="lblGender" runat="server" Text="Chọn giới tính: "></asp:Label>
    <asp:RadioButton ID="raMale" runat="server" GroupName="gender" Text="Nam" Checked="true" />
    <asp:RadioButton ID="raFemale" runat="server" GroupName="gender" Text="Nữ" />
    <br /><br />

    <!-- Nhập tên -->
    <asp:Label ID="lblNamePrompt" runat="server" Text="Nhập tên của bạn: "></asp:Label>
    <asp:TextBox ID="txtName" runat="server" placeholder="Nhập tên của bạn" ></asp:TextBox>
    <br /><br />

    <!-- Nút gửi -->
    <asp:Button ID="btnSubmit" runat="server" Text="Chào mừng" OnClick="btnSubmit_Click" Height="24px" Width="100px" />
    <br />
    <asp:Label ID="lblResult" runat="server" ForeColor="Blue"></asp:Label>

    <br />
    <br />
    <br />
    <br />
    <asp:TextBox ID="txtuser" runat="server" placeholder="Nhập tên người dùng"></asp:TextBox>
<asp:TextBox ID="txtfull" runat="server" placeholder="Nhập họ tên đầy đủ"></asp:TextBox>
<asp:TextBox ID="txtmail" runat="server" placeholder="Nhập email"></asp:TextBox>
<asp:DropDownList ID="DropDownList1" runat="server">
    <asp:ListItem Text="Nam" Value="Nam" />
    <asp:ListItem Text="Nữ" Value="Nữ" />

</asp:DropDownList>

    <!-- SqlDataSource kết nối với cơ sở dữ liệu -->
    <asp:SqlDataSource 

        ID="SqlDataSource1" 
        runat="server" 
        ConnectionString="<%$ ConnectionStrings:YourConnectionStringName %>" 
        SelectCommand="SELECT * FROM tbluser"
        DeleteCommand="DELETE FROM tbluser WHERE username = @username"
        InsertCommand="INSERT INTO tbluser (username, fullname, email, gender) VALUES (@username, @fullname, @email, @gender)"
        UpdateCommand="UPDATE tbluser SET fullname = @fullname, email = @email, gender = @gender WHERE username = @username">
    </asp:SqlDataSource>

    <!-- GridView để hiển thị và thao tác với dữ liệu -->
    <asp:GridView ID="GridView1" runat="server"  DataKeyNames="username" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="table">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
            <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
            <asp:BoundField DataField="fullname" HeaderText="Full Name" SortExpression="fullname" />
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
            <asp:BoundField DataField="gender" HeaderText="Gender" SortExpression="gender" />
        </Columns>
    </asp:GridView>
    <br />
    <br />
</asp:Content>
