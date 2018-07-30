<%@ Page Language="VB" EnableEventValidation="false" %>
<%@ import Namespace="System.Web.Mail" %>
<script language="VB" runat="server">
Public Sub Page_Load(ByVal sender As Object, ByVal E As EventArgs)
    Dim mail As New MailMessage
    Dim myMail As SmtpMail
    'Dim myMail As New System.Net.Mail.MailMessage()

    Dim firstname As String = Request("firstname")
    Dim lastname As String = Request("lastname")
    Dim email As String = Request("email")
    Dim telephone As String =  Request("telephone")
    Dim comments As String =  Request("comments")
    Dim sports As String = Request("sports")
    Dim state As String =  Request("state")

    'mail = New MailMessage()
    'Dim client As SmtpClient = New SmtpClient("smtp-server-host")
    'mail.From = New MailAddress("supercross@supercrossking.com")
    mail.From = "supercross@supercrossking.com"
    mail.To = email
    'mail.From = email
    'mail.To = "supercross@supercrossking.com"
    mail.Subject = "The subject"
    mail.Body = "Hello, " & firstname & " " & lastname & vbLf
    mail.Body += "Firstname = " & firstname & vbLf
    mail.Body += "Lastname = " & lastname & vbLf
    mail.Body += "Email = " & email & vbLf
    mail.Body += "Telephone = " & telephone & vbLf
    mail.Body += "Comments = " & comments & vbLf
    mail.Body += "Sports = " & sports & vbLf
    mail.Body += "State = " & state & vbLf

    mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate", "1") 'basic authentication
    mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendusername", "supercross@supercrossking.com") 'set your username here
    mail.Fields.Add("http://schemas.microsoft.com/cdo/configuration/sendpassword", "sckingnsx250!") 'set your password here

    myMail.SmtpServer = "mail.supercrossking.com"
    myMail.Send(mail)

    Response.Redirect("thankyou.html", False)

End Sub
</script>
