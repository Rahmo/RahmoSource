

2016-03-08 19:00:58,874 [21] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Details/2143
URLReferrer:http://localhost:8164/Geo133Form/List?page=17
Message:The ObjectContext instance has been disposed and can no longer be used for operations that require a connection.
Source:   at System.Data.Objects.ObjectContext.EnsureConnection()
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.Execute(MergeOption mergeOption)
   at System.Data.Objects.DataClasses.EntityReference`1.Load(MergeOption mergeOption)
   at System.Data.Objects.DataClasses.RelatedEnd.Load()
   at System.Data.Objects.DataClasses.RelatedEnd.DeferredLoad()
   at System.Data.Objects.Internal.LazyLoadBehavior.LoadProperty[TItem](TItem propertyValue, String relationshipName, String targetRoleName, Boolean mustBeNull, Object wrapperObject)
   at System.Data.Objects.Internal.LazyLoadBehavior.<>c__DisplayClass0_0`2.<GetInterceptorDelegate>b__2(TProxy proxy, TItem item)
   at System.Data.Entity.DynamicProxies.GEO133_4448D3966735B2C3A4233DA56635465CED0314225B5076DCF5DD005D42E2ED41.get_siteData()
   at lambda_method(Closure , GEO133 , List`1 )
   at System.Web.Mvc.ExpressionUtil.CachedExpressionCompiler.Compiler`2.<>c__DisplayClass8.<CompileFromFingerprint>b__4(TIn model)
   at System.Web.Mvc.ModelMetadata.<>c__DisplayClass3`2.<FromLambdaExpression>b__2()
   at System.Web.Mvc.ModelMetadata.get_Model()
   at System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)
   at System.Web.Mvc.Html.DisplayExtensions.DisplayFor[TModel,TValue](HtmlHelper`1 html, Expression`1 expression)
   at ASP._Page_Views_Geo133Form_Details_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\Details.cshtml:line 71
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-08 19:03:06,983 [16] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Details/1091
URLReferrer:http://localhost:8164/Geo133Form/List?page=10
Message:The ObjectContext instance has been disposed and can no longer be used for operations that require a connection.
Source:   at System.Data.Objects.ObjectContext.EnsureConnection()
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.Execute(MergeOption mergeOption)
   at System.Data.Objects.DataClasses.EntityReference`1.Load(MergeOption mergeOption)
   at System.Data.Objects.DataClasses.RelatedEnd.Load()
   at System.Data.Objects.DataClasses.RelatedEnd.DeferredLoad()
   at System.Data.Objects.Internal.LazyLoadBehavior.LoadProperty[TItem](TItem propertyValue, String relationshipName, String targetRoleName, Boolean mustBeNull, Object wrapperObject)
   at System.Data.Objects.Internal.LazyLoadBehavior.<>c__DisplayClass0_0`2.<GetInterceptorDelegate>b__2(TProxy proxy, TItem item)
   at System.Data.Entity.DynamicProxies.GEO133_4448D3966735B2C3A4233DA56635465CED0314225B5076DCF5DD005D42E2ED41.get_siteData()
   at lambda_method(Closure , GEO133 , List`1 )
   at System.Web.Mvc.ExpressionUtil.CachedExpressionCompiler.Compiler`2.<>c__DisplayClass8.<CompileFromFingerprint>b__4(TIn model)
   at System.Web.Mvc.ModelMetadata.<>c__DisplayClass3`2.<FromLambdaExpression>b__2()
   at System.Web.Mvc.ModelMetadata.get_Model()
   at System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)
   at System.Web.Mvc.Html.DisplayExtensions.DisplayFor[TModel,TValue](HtmlHelper`1 html, Expression`1 expression)
   at ASP._Page_Views_Geo133Form_Details_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\Details.cshtml:line 71
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-08 19:19:57,018 [26] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Details/2143
URLReferrer:http://localhost:8164/Geo133Form/List?page=17
Message:The ObjectContext instance has been disposed and can no longer be used for operations that require a connection.
Source:   at System.Data.Objects.ObjectContext.EnsureConnection()
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.Execute(MergeOption mergeOption)
   at System.Data.Objects.DataClasses.EntityReference`1.Load(MergeOption mergeOption)
   at System.Data.Objects.DataClasses.RelatedEnd.Load()
   at System.Data.Objects.DataClasses.RelatedEnd.DeferredLoad()
   at System.Data.Objects.Internal.LazyLoadBehavior.LoadProperty[TItem](TItem propertyValue, String relationshipName, String targetRoleName, Boolean mustBeNull, Object wrapperObject)
   at System.Data.Objects.Internal.LazyLoadBehavior.<>c__DisplayClass0_0`2.<GetInterceptorDelegate>b__2(TProxy proxy, TItem item)
   at System.Data.Entity.DynamicProxies.GEO133_4448D3966735B2C3A4233DA56635465CED0314225B5076DCF5DD005D42E2ED41.get_siteData()
   at lambda_method(Closure , GEO133 , List`1 )
   at System.Web.Mvc.ExpressionUtil.CachedExpressionCompiler.Compiler`2.<>c__DisplayClass8.<CompileFromFingerprint>b__4(TIn model)
   at System.Web.Mvc.ModelMetadata.<>c__DisplayClass3`2.<FromLambdaExpression>b__2()
   at System.Web.Mvc.ModelMetadata.get_Model()
   at System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData, ExecuteTemplateDelegate executeTemplate)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateHelper(HtmlHelper html, ModelMetadata metadata, String htmlFieldName, String templateName, DataBoundControlMode mode, Object additionalViewData)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData, TemplateHelperDelegate templateHelper)
   at System.Web.Mvc.Html.TemplateHelpers.TemplateFor[TContainer,TValue](HtmlHelper`1 html, Expression`1 expression, String templateName, String htmlFieldName, DataBoundControlMode mode, Object additionalViewData)
   at System.Web.Mvc.Html.DisplayExtensions.DisplayFor[TModel,TValue](HtmlHelper`1 html, Expression`1 expression)
   at ASP._Page_Views_Geo133Form_Details_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\Details.cshtml:line 71
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-08 19:26:31,498 [30] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/teacher
URLReferrer:
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Views_Geo133Form_teacher_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\teacher.cshtml:line 36
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-08 19:28:53,082 [30] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Details/41
URLReferrer:http://localhost:8164/Geo133Form/List?page=4
Message:The 'isCurrentYearAsPrev' property on 'GeoOnlineInformation' could not be set to a 'null' value. You must set this property to a non-null value of type 'Boolean'. 
Source:   at System.Data.Common.Internal.Materialization.Shaper.ErrorHandlingValueReader`1.GetValue(DbDataReader reader, Int32 ordinal)
   at System.Data.Common.Internal.Materialization.Shaper.GetPropertyValueWithErrorHandling[TProperty](Int32 ordinal, String propertyName, String typeName)
   at lambda_method(Closure , Shaper )
   at System.Data.Common.Internal.Materialization.Shaper.HandleEntityAppendOnly[TEntity](Func`2 constructEntityDelegate, EntityKey entityKey, EntitySet entitySet)
   at lambda_method(Closure , Shaper )
   at System.Data.Common.Internal.Materialization.Coordinator`1.ReadNextElement(Shaper shaper)
   at System.Data.Common.Internal.Materialization.Shaper`1.SimpleEnumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Data.Objects.DataClasses.EntityReference`1.Load(MergeOption mergeOption)
   at System.Data.Objects.DataClasses.RelatedEnd.Load()
   at System.Data.Objects.DataClasses.RelatedEnd.DeferredLoad()
   at System.Data.Objects.Internal.LazyLoadBehavior.LoadProperty[TItem](TItem propertyValue, String relationshipName, String targetRoleName, Boolean mustBeNull, Object wrapperObject)
   at System.Data.Objects.Internal.LazyLoadBehavior.<>c__DisplayClass0_0`2.<GetInterceptorDelegate>b__2(TProxy proxy, TItem item)
   at System.Data.Entity.DynamicProxies.GEO133_4448D3966735B2C3A4233DA56635465CED0314225B5076DCF5DD005D42E2ED41.get_OnlineInfo()
   at ICStars2_0.Controllers.Geo133FormController.Details(Int32 id) in C:\NewIDEProject\ICStars2_0\ICStars2_0\Controllers\Geo133FormController.cs:line 86
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass42.<BeginInvokeSynchronousActionMethod>b__41()
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass8`1.<BeginSynchronous>b__7(IAsyncResult _)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass37.<>c__DisplayClass39.<BeginInvokeActionMethodWithFilters>b__33()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass4f.<InvokeActionMethodFilterAsynchronously>b__49()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass37.<BeginInvokeActionMethodWithFilters>b__36(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:14:07,433 [9] ERROR ICStars2_0.Global [(null)] - 
UserName:SlcStudent
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/teacher
URLReferrer:http://localhost:8164/Geo133Form/teacher?
Message:c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\teacher.cshtml(27): error CS1501: No overload for method 'ActionLink' takes 0 arguments
Source:   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetObjectFactory(String virtualPath, Boolean throwIfNotFound)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)
   at System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)
   at System.Web.Mvc.VirtualPathProviderViewEngine.<>c__DisplayClass4.<GetPathFromGeneralName>b__0(String path)
   at System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)
   at System.Web.WebPages.DisplayModeProvider.<>c__DisplayClassb.<GetDisplayInfoForVirtualPath>b__8(IDisplayMode mode)
   at System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)
   at System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)
   at System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 cacheLocator, Func`2 locator)
   at System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)
   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:27:58,580 [43] ERROR ICStars2_0.Global [(null)] - 
UserName:SlcStudent
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:The view 'Login' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Geo133Form/Login.aspx
~/Views/Geo133Form/Login.ascx
~/Views/Shared/Login.aspx
~/Views/Shared/Login.ascx
~/Views/Geo133Form/Login.cshtml
~/Views/Geo133Form/Login.vbhtml
~/Views/Shared/Login.cshtml
~/Views/Shared/Login.vbhtml
Source:   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:29:02,726 [51] ERROR ICStars2_0.Global [(null)] - 
UserName:SlcStudent
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:
Message:A public action method 'Login' was not found on controller 'ICStars2_0.Controllers.Geo133FormController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:32:25,357 [17] ERROR ICStars2_0.Global [(null)] - 
UserName:SlcStudent
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/teacher
URLReferrer:
Message:c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\teacher.cshtml(22): error CS0103: The name 'Class' does not exist in the current context
Source:   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetObjectFactory(String virtualPath, Boolean throwIfNotFound)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)
   at System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)
   at System.Web.Mvc.VirtualPathProviderViewEngine.<>c__DisplayClass4.<GetPathFromGeneralName>b__0(String path)
   at System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)
   at System.Web.WebPages.DisplayModeProvider.<>c__DisplayClassb.<GetDisplayInfoForVirtualPath>b__8(IDisplayMode mode)
   at System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)
   at System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)
   at System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 cacheLocator, Func`2 locator)
   at System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)
   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:33:14,832 [17] ERROR ICStars2_0.Global [(null)] - 
UserName:SlcStudent
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:The view 'Login' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Geo133Form/Login.aspx
~/Views/Geo133Form/Login.ascx
~/Views/Shared/Login.aspx
~/Views/Shared/Login.ascx
~/Views/Geo133Form/Login.cshtml
~/Views/Geo133Form/Login.vbhtml
~/Views/Shared/Login.cshtml
~/Views/Shared/Login.vbhtml
Source:   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:35:15,866 [17] ERROR ICStars2_0.Global [(null)] - 
UserName:SlcStudent
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:The view 'Login' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Geo133Form/Login.aspx
~/Views/Geo133Form/Login.ascx
~/Views/Shared/Login.aspx
~/Views/Shared/Login.ascx
~/Views/Geo133Form/Login.cshtml
~/Views/Geo133Form/Login.vbhtml
~/Views/Shared/Login.cshtml
~/Views/Shared/Login.vbhtml
Source:   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:40:30,483 [45] ERROR ICStars2_0.Global [(null)] - 
UserName:SlcStudent
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:The view 'Login' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Views/Geo133Form/Login.aspx
~/Views/Geo133Form/Login.ascx
~/Views/Shared/Login.aspx
~/Views/Shared/Login.ascx
~/Views/Geo133Form/Login.cshtml
~/Views/Geo133Form/Login.vbhtml
~/Views/Shared/Login.cshtml
~/Views/Shared/Login.vbhtml
Source:   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 15:51:01,579 [18] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Account/Login?ReturnUrl=/Geo133Form/List
URLReferrer:
Message:The handle is invalid. (Exception from HRESULT: 0x80070006 (E_HANDLE))
Source:   at System.Runtime.InteropServices.Marshal.ThrowExceptionForHRInternal(Int32 errorCode, IntPtr errorInfo)
   at System.Runtime.InteropServices.Marshal.ThrowExceptionForHR(Int32 errorCode)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionFactory.TryGetConnection(DbConnection owningConnection, TaskCompletionSource`1 retry, DbConnectionOptions userOptions, DbConnectionInternal oldConnection, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionInternal.TryOpenConnectionInternal(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.ProviderBase.DbConnectionClosed.TryOpenConnection(DbConnection outerConnection, DbConnectionFactory connectionFactory, TaskCompletionSource`1 retry, DbConnectionOptions userOptions)
   at System.Data.SqlClient.SqlConnection.TryOpenInner(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.TryOpen(TaskCompletionSource`1 retry)
   at System.Data.SqlClient.SqlConnection.Open()
   at System.Data.EntityClient.EntityConnection.OpenStoreConnectionIf(Boolean openCondition, DbConnection storeConnectionToOpen, DbConnection originalConnection, String exceptionCode, String attemptedOperation, Boolean& closeStoreConnectionOnFailure)


2016-03-09 15:59:58,043 [17] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher?returnUrl=/Geo133Form/List
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Views_Geo133Form_List_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\List.cshtml:line 30
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 16:01:54,835 [55] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Views_Geo133Form_List_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\List.cshtml:line 30
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 16:07:30,164 [15] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Views_Geo133Form_List_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\List.cshtml:line 30
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 16:14:43,815 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Views_Geo133Form_List_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\List.cshtml:line 30
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 16:17:22,348 [49] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/Login
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Views_Geo133Form_List_cshtml.Execute() in c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\List.cshtml:line 30
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.StartPage.RunPage()
   at System.Web.WebPages.StartPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 16:35:49,268 [55] ERROR ICStars2_0.Global [(null)] - 
UserName:Euan2016
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/List
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:c:\NewIDEProject\ICStars2_0\ICStars2_0\Views\Geo133Form\List.cshtml(74): error CS0103: The name 'currentSearch' does not exist in the current context
Source:   at System.Web.Compilation.AssemblyBuilder.Compile()
   at System.Web.Compilation.BuildProvidersCompiler.PerformBuild()
   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.GetObjectFactory(String virtualPath, Boolean throwIfNotFound)
   at System.Web.Mvc.BuildManagerWrapper.System.Web.Mvc.IBuildManager.FileExists(String virtualPath)
   at System.Web.Mvc.BuildManagerViewEngine.FileExists(ControllerContext controllerContext, String virtualPath)
   at System.Web.Mvc.VirtualPathProviderViewEngine.<>c__DisplayClass4.<GetPathFromGeneralName>b__0(String path)
   at System.Web.WebPages.DefaultDisplayMode.GetDisplayInfo(HttpContextBase httpContext, String virtualPath, Func`2 virtualPathExists)
   at System.Web.WebPages.DisplayModeProvider.<>c__DisplayClassb.<GetDisplayInfoForVirtualPath>b__8(IDisplayMode mode)
   at System.Linq.Enumerable.WhereSelectListIterator`2.MoveNext()
   at System.Linq.Enumerable.FirstOrDefault[TSource](IEnumerable`1 source, Func`2 predicate)
   at System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode, Boolean requireConsistentDisplayMode)
   at System.Web.WebPages.DisplayModeProvider.GetDisplayInfoForVirtualPath(String virtualPath, HttpContextBase httpContext, Func`2 virtualPathExists, IDisplayMode currentDisplayMode)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 cacheLocator, Func`2 locator)
   at System.Web.Mvc.ViewEngineCollection.FindView(ControllerContext controllerContext, String viewName, String masterName)
   at System.Web.Mvc.ViewResult.FindView(ControllerContext context)
   at System.Web.Mvc.ViewResultBase.ExecuteResult(ControllerContext context)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResult(ControllerContext controllerContext, ActionResult actionResult)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<InvokeActionResultWithFilters>b__17()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultFilter(IResultFilter filter, ResultExecutingContext preContext, Func`1 continuation)
   at System.Web.Mvc.ControllerActionInvoker.<>c__DisplayClass1a.<>c__DisplayClass1c.<InvokeActionResultWithFilters>b__19()
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionResultWithFilters(ControllerContext controllerContext, IList`1 filters, ActionResult actionResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 17:16:25,046 [47] ERROR ICStars2_0.Global [(null)] - 
UserName:Euan2016
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/List
URLReferrer:
Message:The method 'Skip' is only supported for sorted input in LINQ to Entities. The method 'OrderBy' must be called before the method 'Skip'.
Source:   at System.Data.Objects.ELinq.ExpressionConverter.OrderByLifter.PassthroughOrderByLifter.Skip(DbExpression k)
   at System.Data.Objects.ELinq.ExpressionConverter.OrderByLifter.Skip(DbExpressionBinding input, DbExpression skipCount)
   at System.Data.Objects.ELinq.ExpressionConverter.Skip(DbExpressionBinding input, DbExpression skipCount)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SkipTranslator.TranslatePagingOperator(ExpressionConverter parent, DbExpression operand, DbExpression count)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.PagingTranslator.TranslateUnary(ExpressionConverter parent, DbExpression operand, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateSet(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.System.Collections.Generic.IEnumerable<T>.GetEnumerator()
   at System.Data.Entity.Internal.Linq.InternalQuery`1.GetEnumerator()
   at System.Data.Entity.Infrastructure.DbQuery`1.System.Collections.Generic.IEnumerable<TResult>.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at PagedList.PagedList`1..ctor(IQueryable`1 superset, Int32 pageNumber, Int32 pageSize)
   at PagedList.PagedListExtensions.ToPagedList[T](IQueryable`1 superset, Int32 pageNumber, Int32 pageSize)
   at ICStars2_0.Controllers.Geo133FormController.List(String sortOrder, String currentFilter, String searchString, Nullable`1 page) in C:\NewIDEProject\ICStars2_0\ICStars2_0\Controllers\Geo133FormController.cs:line 253
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.InvokeSynchronousActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass42.<BeginInvokeSynchronousActionMethod>b__41()
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass8`1.<BeginSynchronous>b__7(IAsyncResult _)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass37.<>c__DisplayClass39.<BeginInvokeActionMethodWithFilters>b__33()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass4f.<InvokeActionMethodFilterAsynchronously>b__49()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass37.<BeginInvokeActionMethodWithFilters>b__36(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2016-03-09 17:18:25,944 [47] ERROR ICStars2_0.Global [(null)] - 
UserName:Euan2016
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36
URL:http://localhost:8164/Geo133Form/List
URLReferrer:http://localhost:8164/Geo133Form/teacher
Message:The method 'Skip' is only supported for sorted input in LINQ to Entities. The method 'OrderBy' must be called before the method 'Skip'.
Source:   at System.Data.Objects.ELinq.ExpressionConverter.OrderByLifter.PassthroughOrderByLifter.Skip(DbExpression k)
   at System.Data.Objects.ELinq.ExpressionConverter.OrderByLifter.Skip(DbExpressionBinding input, DbExpression skipCount)
   at System.Data.Objects.ELinq.ExpressionConverter.Skip(DbExpressionBinding input, DbExpression skipCount)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SkipTranslator.TranslatePagingOperator(ExpressionConverter parent, DbExpression operand, DbExpression count)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.PagingTranslator.TranslateUnary(ExpressionConverter parent, DbExpression operand, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateSet(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.System.Collections.Generic.IEnumerable<T>.GetEnumerator()
   at System.Data.Entity.Internal.Linq.InternalQuery`1.GetEnumerator()
   at System.Data.Entity.Infrastructure.DbQuery`1.System.Collections.Generic.IEnumerable<TResult>.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at PagedList.PagedList`1..ctor(IQueryable`1 superset, Int32 pageNumber, Int32 pageSize)
   at PagedList.PagedListExtensions.ToPagedList[T](IQueryable`1 superset, Int32 pageNumber, Int32 pageSize)
   at ICStars2_0.Controllers.Geo133FormController.List(String sortOrder, String currentFilter, String searchString, Nullable`1 page) in C:\NewIDEProject\ICStars2_0\ICStars2_0\Controllers\Geo133FormController.cs:line 253
   at lambda_method(Closure , ControllerBase , Object[] )
   at System.Web.Mvc.ActionMethodDispatcher.Execute(ControllerBase controller, Object[] parameters)
   at System.Web.Mvc.ReflectedActionDescriptor.Execute(ControllerContext controllerContext, IDictionary`2 parameters)
   at System.Web.Mvc.ControllerActionInvoker.InvokeActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.InvokeSynchronousActionMethod(ControllerContext controllerContext, ActionDescriptor actionDescriptor, IDictionary`2 parameters)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass42.<BeginInvokeSynchronousActionMethod>b__41()
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass8`1.<BeginSynchronous>b__7(IAsyncResult _)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethod(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass37.<>c__DisplayClass39.<BeginInvokeActionMethodWithFilters>b__33()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass4f.<InvokeActionMethodFilterAsynchronously>b__49()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass37.<BeginInvokeActionMethodWithFilters>b__36(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeActionMethodWithFilters(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<>c__DisplayClass2a.<BeginInvokeAction>b__20()
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.<>c__DisplayClass25.<BeginInvokeAction>b__22(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncControllerActionInvoker.EndInvokeAction(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.<>c__DisplayClass1d.<BeginExecuteCore>b__18(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecuteCore(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Controller.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.Controller.System.Web.Mvc.Async.IAsyncController.EndExecute(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.<>c__DisplayClass8.<BeginProcessRequest>b__3(IAsyncResult asyncResult)
   at System.Web.Mvc.Async.AsyncResultWrapper.<>c__DisplayClass4.<MakeVoidDelegate>b__3(IAsyncResult ar)
   at System.Web.Mvc.Async.AsyncResultWrapper.WrappedAsyncResult`1.End()
   at System.Web.Mvc.Async.AsyncResultWrapper.End[TResult](IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.Async.AsyncResultWrapper.End(IAsyncResult asyncResult, Object tag)
   at System.Web.Mvc.MvcHandler.EndProcessRequest(IAsyncResult asyncResult)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.EndProcessRequest(IAsyncResult result)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)
