<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jspf"%>

<div class="container">
    <div class="row">
        <div class="span3">
            <%@ include file="../common/sidebar.jspf"%>
        </div>
        <div class="span9">
            <div class="well">
                <div class="page-header">
                    <h1>Update todo</h1>
                </div>

                <s:form namespace="/todo" action="update.do" method="post" cssClass="form-horizontal">

                    <fieldset>

                        <div class="control-group">
                            <label class="control-label" for="id">Todo Id:</label>
                            <div class="controls">
                                <s:textfield id="id" name="todo.id" disabled="true" />
                                <%--issue with value="todo.id"--%>
                                <input type="hidden" name="todoId" value="${todo.id}"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="title">Title:</label>
                            <div class="controls">
                                <s:textfield id="title" name="todo.title" required="required" autofocus="autofocus" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="dueDate">Due date:</label>
                            <div class="controls">
                                <s:textfield id="dueDate" name="todo.dueDate" required="required"/>
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="status">Status:</label>
                            <div class="controls">
                                <s:select id="status" name="todo.done" list="#{'true':'Done', 'false':'Todo'}" />
                            </div>
                        </div>

                        <div class="control-group">
                            <label class="control-label" for="priority">Priority:</label>
                            <div class="controls">
                                <s:select id="priority" name="todo.priority" list="#{'LOW':'Low', 'MEDIUM':'Medium', 'HIGH':'High'}" />
                            </div>
                        </div>

                        <%-- issue with s:hidden : not able to set 'value' attribute with ${todo.userId} nor %{todo.userId} --%>
                        <input type="hidden" name="todo.userId" value="${todo.userId}"/>

                        <div class="form-actions">
                            <s:submit cssClass="btn btn-primary" value="Update"/>
                            <button type="button" class="btn" onclick="history.go(-1)"><i class="icon-remove"></i> Cancel</button>
                        </div>

                    </fieldset>

                    <script>
                        $('#dueDate').datepicker({
                            format : 'dd/mm/yyyy'
                        });
                    </script>

                </s:form>

            </div>
        </div>
    </div>
</div>

<%--end content--%>
<%@ include file="../common/footer.jspf"%>
