<%@page import="com.liferay.docs.guestbook.service.GuestbookEntryLocalServiceUtil"%>
<%@page import="com.liferay.docs.guestbook.model.GuestbookEntry"%>
<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ include file="../init.jsp" %>

<portlet:renderURL var="viewURL">
    <portlet:param name="mvcPath" value="/guestbook/view.jsp"></portlet:param>
</portlet:renderURL>

<portlet:actionURL name="addEntry" var="addEntryURL"></portlet:actionURL>

<%
 long entryId = ParamUtil.getLong(renderRequest, "entryId");
GuestbookEntry entry=null;
if(entryId>0){
	
	entry=GuestbookEntryLocalServiceUtil.getGuestbookEntry(entryId);
}


long guestbookId=ParamUtil.getLong(renderRequest, "guestbookId");
%>

<aui:form action="<%=addEntryURL%>" name="<portlet:namespace />fm">

<aui:model-context bean="<%=entry %>" model="<%= GuestbookEntry.class %>" />

	<aui:fieldset>

		<aui:input name="name" placeholder="Enter your full name" >
		<aui:validator name="required"></aui:validator>
		</aui:input>
		<aui:input name="email" >
		<aui:validator name="required"></aui:validator>
		</aui:input>
		<aui:input name="message" />
		<aui:input name="entryId" type="hidden" />
		<aui:input name="guestbookId" type="hidden" value='<%=entry == null ? guestbookId : entry.getGuestbookId() %>'/>

	</aui:fieldset>

	<aui:button-row>

		<aui:button type="submit"></aui:button>
		<aui:button type="cancel" onClick="<%= viewURL.toString() %>"></aui:button>

	</aui:button-row>

</aui:form>