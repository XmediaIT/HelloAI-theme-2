<%@ Register TagPrefix="dnn" TagName="TITLE" Src="~/Admin/Containers/Title.ascx" %>
<%@ Control language="C#" AutoEventWireup="true" Inherits="DotNetNuke.UI.Containers.Container" %>
<div class="eds-containers-HelloAI-theme-2 eds-container eds-container--default">
  <div class="eds-container__title"><dnn:TITLE runat="server" ID="dnnTITLE" /></div>
  <div class="eds-container__content" id="ContentPane" runat="server"></div>
</div>
