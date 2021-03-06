﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SkipToPage.ascx.cs" Inherits="Mandeeps.DNN.Modules.LiveForms.UI.Design.Actions.ClientSide.SkipToPage" %>
<%@ Register TagPrefix="LF" TagName="ConditionControl" Src="../Conditions.ascx" %>
<%@ Register TagPrefix="dnn" TagName="Label" Src="~/controls/Labelcontrol.ascx" %>
<div class="LiveForm">
    
    <table style="float: right">
        <tr>
            <td>
                <dnn:Label runat="server" ResourceKey="lActionName" />
            </td>
            <td>
                <asp:TextBox runat="server" class="sfcommon" EnableViewState="true" ID="tbActionName"></asp:TextBox>
            </td>
        </tr>
    </table>
        <div style="clear: both;"></div>
<div class="caption">
    <asp:Label ID="lActionInfo" runat="server" Resourcekey="lActionInfo" />
</div>
<div>
    <table style="background-color: lightgray; padding: 8px; width: 100%; margin-bottom:10px;">
         
        <tr>
            <td style="width: 50px; padding-left: 6px;">
                <asp:Label ID="lbSkipTo" runat="server" resourcekey="lbSkipTo"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlSkipTo" runat="server"></asp:DropDownList></td>
        </tr>
    </table>

</div>
<div class="caption">
    <asp:Label ID="lConditionInfo" runat="server" Resourcekey="lConditionInfo" />
</div>
<table style="width: 100%;">
    <tr>
        <td>
        <LF:conditioncontrol id="CConditionSet" runat="server"></LF:conditioncontrol>
       </td>
   </tr>
    <tr>
        <td>
            <asp:LinkButton ID="bUpdate" runat="server" CssClass="mbutton" OnClientClick="return Conditions.IsValid('bSave');" OnClick="bUpdate_Click"></asp:LinkButton>
           <asp:LinkButton ID="bCancel" Text="Back" CssClass="mbutton2" ResourceKey="bCancel" runat="server" OnClick="bBack_Click"></asp:LinkButton>
            </td>
    </tr>
</table>
</div>
