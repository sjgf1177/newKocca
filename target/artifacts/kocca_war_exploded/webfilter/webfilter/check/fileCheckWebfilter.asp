<% 
Function eregi_replace(pattern, replace, text)
	Dim eregObj:

	Set eregObj = new RegExp:

	eregObj.Pattern = pattern: '//���� ����
	eregObj.IgnoreCase = True: '//��ҹ��� ���� ����
	eregObj.Global = True: '//��ü �������� �˻�

	eregi_replace = eregObj.Replace(text, replace): '//Replace String
End Function

'//����±� ���� ��� �±����� �Լ�
Function strip_tags(str)
	Dim content, pattern:

	content = str:
	pattern = "(<!--.*-->)":'SCRIPTS
	content = eregi_replace(pattern, "", content):
	pattern = "(?:(#.*\\n{0,1})|//.*\\n{0,1})|(?:/\\*(?:.|\\s)*?\\*/\\n{0,1}|<(?i)script[^>]*>[\\w\\W\\r]*</(?i)script>|<(?i)style[^>]*>[\\w\\W\\r]*</(?i)style>)":'SCRIPTS
	content = eregi_replace(pattern, "", content):
	
	strip_tags = content:
End Function

Const Filename = Request.QueryString("filepath")
Const ForReading = 1
Const TristateUseDefault = -2

Dim FSO
set FSO = server.createObject("Scripting.FileSystemObject")

Dim Filepath
Filepath = Server.MapPath(Filename)

if FSO.FileExists(Filepath) Then

 Set TextStream = FSO.OpenTextFile(Filepath, ForReading, False, TristateUseDefault)
 
 Dim Contents
 Contents = TextStream.ReadAll
 Contents = strip_tags(Contents):
 If Contents.indexOf("initCheckWebfilter.asp") > -1 then
	resopnse.write "insert"
 Else
	resopnse.write "delete"
 End If
 
 TextStream.Close
 Set TextStream = nothing
 
Else

 resopnse.write "delete"

End If

Set FSO = Nothing
%>

