<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工列表</title>
    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <link rel="stylesheet" href="${APP_PATH }/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">
    <script src="${APP_PATH }/static/js/jquery.min.js"></script>
    <script src="${APP_PATH }/static/bootstrap-3.4.1-dist/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
</head>
<body>
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="empName_update_static"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="email_update_input" placeholder="email@atgugui.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>
    <div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">员工添加</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal">
                        <div class="form-group">
                            <label class="col-sm-2 control-label">empName</label>
                            <div class="col-sm-10">
                                <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">email</label>
                            <div class="col-sm-10">
                                <input type="text" name="email" class="form-control" id="email_add_input" placeholder="email@atgugui.com">
                                <span class="help-block"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">gender</label>
                            <div class="col-sm-10">
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 control-label">deptName</label>
                            <div class="col-sm-4">
                                <select class="form-control" name="dId" id="dept_add_select"></select>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSM-CRUD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover" id="emps_table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>empName</th>
                            <th>gender</th>
                            <th>email</th>
                            <th>deptName</th>
                            <th>操作</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6" id="page_info_area"></div>
            <div class="col-md-6" id="page_nav_area"></div>
        </div>
    </div>
    <script>
        var totalRecord;
        $(function () {
            to_page(1);
        });
        function to_page(page){
            $.ajax({
                url:"${APP_PATH}/emps",
                data:"page="+page,
                type:"GET",
                success:function (result){
                    build_emps_table(result);
                    build_page_info(result);
                    build_page_nav(result);
                }
            });
        }
        function build_emps_table(result){
            $("#emps_table tbody").empty();
            var emps =result.extend.pageInfo.list;
            $.each(emps,function (index,item){
                var empIdTd = $("<td></td>").append(item.empId);
                var empNameTd=$("<td></td>").append(item.empName);
                var genderTd=$("<td></td>").append(item.gender=="M"?"男":"女");
                var emailTd=$("<td></td>").append(item.email);
                var deptNameTd=$("<td></td>").append(item.department.deptName);
                var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
                editBtn.attr("edit-id",item.empId);
                var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
                deleteBtn.attr("edit-id",item.empId);
                var btnTd= $("<td></td>").append(editBtn).append(" ").append(deleteBtn);
                $("<tr></tr>").append(empIdTd)
                    .append(empNameTd)
                    .append(genderTd)
                    .append(emailTd)
                    .append(deptNameTd)
                    .append(btnTd)
                    .appendTo("#emps_table tbody");
            });
        }
        function build_page_info(result){
            $("#page_info_area").empty();
            $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总共"+result.extend.pageInfo.pages+"页,总共"+result.extend.pageInfo.total+"条记录")
            totalRecord = result.extend.pageInfo.total;
        }
        function build_page_nav(result){
            $("#page_nav_area").empty();
            var ul =$("<ul></ul>").addClass("pagination");

            var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
            var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
            if (result.extend.pageInfo.hasPreviousPage==false){
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            }else {
                firstPageLi.click(function (){
                    to_page(1);
                });
                prePageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum-1);
                });
            }


            var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
            var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
            if (result.extend.pageInfo.hasNextPage==false){
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            }else {
                nextPageLi.click(function (){
                    to_page(result.extend.pageInfo.pageNum+1);
                });
                lastPageLi.click(function (){
                    to_page(result.extend.pageInfo.pages);
                });
            }

            ul.append(firstPageLi).append(prePageLi);
            $.each(result.extend.pageInfo.navigatepageNums,function (index,item){
                var numLi=$("<li></li>").append($("<a></a>").append(item));
                if (result.extend.pageInfo.pageNum == item){
                    numLi.addClass("active");
                }else {
                    numLi.click(function (){
                        to_page(item);
                    });
                }
                ul.append(numLi);
            });
            ul.append(nextPageLi).append(lastPageLi);
            var navEle =$("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav_area");
        }
        function reset_from (ele){
            $(ele)[0].reset();
            $(ele).removeClass("has-error has-success");
            $(ele).find(".help-block").text("");
        }
        $("#emp_add_modal_btn").click(function (){
            $("#empAddModal form")[0].reset();
            getDepts("#dept_add_select");
           $("#empAddModal").modal({
               backdrop:"static"
           });
        });
        function getDepts(ele) {
            $.ajax({
                url: "${APP_PATH}/depts",
                type:"GET",
                success:function (result){
                    $("#dept_add_select").empty();
                    $.each(result.extend.depts,function (){
                       var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                       optionEle.appendTo(ele);
                    });
                }
            });
        }
        function validate_add_form(){
            var empName = $("#empName_add_input").val();
            var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
            if (!regName.test(empName)) {
                //alert("用户名可以是2-5位中文或者6-16位英文和数字的组合");
                show_validate_msg("#empName_add_input","error","用户名必须是2-5位中文或者6-16位英文和数字的组合");
                return false;
            }else {
                show_validate_msg("#empName_add_input","success","");

            }
            var email = $("#email_add_input").val();
            var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
            if (!regEmail.test(email)){
                //alert("邮箱格式不正确");
                show_validate_msg("#email_add_input","error","邮箱格式不正确");
                return false;
            }else {
                show_validate_msg("#email_add_input","success","");
            }
            return true;
        }
        function show_validate_msg(ele,status,msg){
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if ("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if ("error"==status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }
        $("#empName_add_input").blur(function () {
            var empName = this.value;
            $.ajax({
                url:"${APP_PATH}/checkuser",
                data:"empName="+empName,
                type:"POST",
                success:function (result) {
                    if(result.code==100){
                        show_validate_msg("#empName_add_input","success","用户名可用");
                        $("#emp_save_btn").attr("ajax-va","success");
                    }else {
                        show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                        $("#emp_save_btn").attr("ajax-va","error");
                    }
                }
            });
        })
        $("#emp_save_btn").click(function (){
            if (!validate_add_form()){
                return false;
            };
            if ($(this).attr("ajax-va")=="error"){
                return false;
            }
            $.ajax({
                url:"${APP_PATH}/emp",
                type:"POST",
                data:$("#empAddModal form").serialize(),
                success:function (result){
                    if (result.code==100){
                        $("#empAddModal").modal("hide");
                        to_page(totalRecord);
                    }else {
                        if (undefined!= result.extend.errorFields.email){
                            show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                        }
                        if (undefined!= result.extend.errorFields.empName){
                            show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);
                        }
                    }
                }
            });
        });
        $(document).on("click",".edit_btn",function (){
            getDepts("#empUpdateModal select");
            getEmp($(this).attr("edit-id"));
            $("#empUpdateModal").modal({
                backdrop: "static"
            });
        });
        function getEmp(id){
            $.ajax({
                url:"${APP_PATH}/emp/"+id,
                type:"GET",
                success:function (result){
                    var empDate = result.extend.emp;
                    $("#empName_update_static").text(empDate.empName);
                    $("#email_update_input").val(empDate.email);
                    $("#empUpdateModal input[name=gender]").val([empDate.gender]);
                    $("#empUpdateModal select").val([empDate.dId]);
                }
            });
        }
    </script>
</body>
</html>
