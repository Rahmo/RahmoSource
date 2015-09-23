

2015-06-30 13:31:36,964 [87] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Resources
URLReferrer:http://localhost:8164/MVProject/Home/
Message:A public action method 'Resources' was not found on controller 'ICStars2_0.Controllers.MvProjectController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
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


2015-06-30 15:02:16,133 [65] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:44:33,227 [58] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:44:55,681 [73] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:44:56,856 [72] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:44:57,169 [58] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:45:23,305 [72] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:45:25,607 [73] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:45:42,322 [72] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:The "li" element was not closed.  All elements must be either self-closing or have a matching end tag.

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-06-30 15:51:09,071 [82] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.130 Safari/537.36
URL:http://localhost:8164/MVProject/Events/
URLReferrer:
Message:Encountered end tag "li" with no matching start tag.  Are your start/end tags properly balanced?

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-07-08 15:01:40,270 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36
URL:http://localhost:8164/SHTracker/WebPage/EditUrl
URLReferrer:
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Areas_SHTracker_Views_WebPage_EditUrl_cshtml.Execute() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Areas\SHTracker\Views\WebPage\EditUrl.cshtml:line 33
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
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


2015-07-14 15:01:08,522 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36
URL:http://localhost:8164/SHTracker/WebPage/EditUrl
URLReferrer:
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Areas_SHTracker_Views_WebPage_EditUrl_cshtml.Execute() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Areas\SHTracker\Views\WebPage\EditUrl.cshtml:line 33
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
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


2015-07-14 15:02:04,278 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.132 Safari/537.36
URL:http://localhost:8164/SHTracker/WebPage/EditUrl
URLReferrer:
Message:Object reference not set to an instance of an object.
Source:   at ASP._Page_Areas_SHTracker_Views_WebPage_EditUrl_cshtml.Execute() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Areas\SHTracker\Views\WebPage\EditUrl.cshtml:line 33
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
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


2015-09-02 14:25:07,189 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MvProject/UploadImageMethod
URLReferrer:http://localhost:8164/MvProject/UploadImage
Message:Object reference not set to an instance of an object.
Source:   at ICStars2_0.Controllers.MvProjectController.UploadImageMethod() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Controllers\MvProjectController.cs:line 139
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


2015-09-02 14:25:52,198 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MvProject/UploadImageMethod
URLReferrer:http://localhost:8164/MvProject/UploadImage
Message:Object reference not set to an instance of an object.
Source:   at ICStars2_0.Controllers.MvProjectController.UploadImageMethod() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Controllers\MvProjectController.cs:line 139
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


2015-09-02 14:26:22,020 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MvProject/UploadImageMethod
URLReferrer:http://localhost:8164/MvProject/UploadImage
Message:Object reference not set to an instance of an object.
Source:   at ICStars2_0.Controllers.MvProjectController.UploadImageMethod() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Controllers\MvProjectController.cs:line 139
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


2015-09-02 14:27:49,296 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/
URLReferrer:
Message:Invalid object name 'cbslusr.Article'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-02 14:32:28,370 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MvProject/UploadImageMethod
URLReferrer:http://localhost:8164/MvProject/UploadImage
Message:Object reference not set to an instance of an object.
Source:   at ICStars2_0.Controllers.MvProjectController.UploadImageMethod() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Controllers\MvProjectController.cs:line 139
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


2015-09-02 14:42:35,761 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/__browserLink/requestData/4c4a8a6559e64fe08b740e914037d1f7?version=2
URLReferrer:http://localhost:8164/MVProject/Gallery
Message:The controller for path '/__browserLink/requestData/4c4a8a6559e64fe08b740e914037d1f7' was not found or does not implement IController.
Source:   at ICStars2_0.Mvc.ICStarsDependencyMvcControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType) in c:\RahmoSource\ICStars2_0\ICStars2_0.Mvc\ICStarsDependencyMvcControllerFactory.cs:line 16
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-02 15:36:07,159 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MvProjectController/UploadImageMethod
URLReferrer:http://localhost:8164/MVProject/UploadImage
Message:The controller for path '/MvProjectController/UploadImageMethod' was not found or does not implement IController.
Source:   at ICStars2_0.Mvc.ICStarsDependencyMvcControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType) in c:\RahmoSource\ICStars2_0\ICStars2_0.Mvc\ICStarsDependencyMvcControllerFactory.cs:line 16
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-02 16:35:06,733 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MvProject/UploadImageMethod
URLReferrer:http://localhost:8164/MvProject/UploadImage
Message:The handle is invalid.

Source:   at System.IO.__Error.WinIOError(Int32 errorCode, String maybeFullPath)
   at System.IO.FileStream.WriteCore(Byte[] buffer, Int32 offset, Int32 count)
   at System.IO.FileStream.Write(Byte[] array, Int32 offset, Int32 count)
   at System.Web.HttpRawUploadedContent.WriteBytes(Int32 offset, Int32 length, Stream stream)
   at System.Web.HttpInputStream.WriteTo(Stream s)
   at System.Web.HttpPostedFile.SaveAs(String filename)
   at System.Web.HttpPostedFileWrapper.SaveAs(String filename)
   at ICStars2_0.Controllers.MvProjectController.UploadImageMethod(String txtCaption) in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Controllers\MvProjectController.cs:line 146
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


2015-09-02 16:45:10,306 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MvProject/UploadImageMethod
URLReferrer:
Message:A public action method 'UploadImageMethod' was not found on controller 'ICStars2_0.Controllers.MvProjectController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
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


2015-09-08 12:08:48,013 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\Views\MVProject\Gallery.cshtml(66): error CS1061: 'string' does not contain a definition for 'Caption' and no extension method 'Caption' accepting a first argument of type 'string' could be found (are you missing a using directive or an assembly reference?)
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-09-08 12:24:24,378 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\Views\MVProject\Gallery.cshtml(68): error CS1579: foreach statement cannot operate on variables of type 'ICStars2_0.Model.ImageGallery' because 'ICStars2_0.Model.ImageGallery' does not contain a public definition for 'GetEnumerator'
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-09-08 12:38:06,635 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\Views\MVProject\Gallery.cshtml(68): error CS1579: foreach statement cannot operate on variables of type 'ICStars2_0.Model.ImageGallery' because 'ICStars2_0.Model.ImageGallery' does not contain a public definition for 'GetEnumerator'
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-09-08 12:47:19,826 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\Views\MVProject\Gallery.cshtml(66): error CS1002: ; expected
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-09-08 15:22:50,516 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:Cannot apply indexing with [] to an expression of type 'System.Dynamic.DynamicObject'
Source:   at CallSite.Target(Closure , CallSite , Object , String , List`1 )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute3[T0,T1,T2,TRet](CallSite site, T0 arg0, T1 arg1, T2 arg2)
   at ICStars2_0.Controllers.MvProjectController.Gallery() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Controllers\MvProjectController.cs:line 131
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


2015-09-08 15:26:33,047 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:Cannot apply indexing with [] to an expression of type 'System.Dynamic.DynamicObject'
Source:   at CallSite.Target(Closure , CallSite , Object , String )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute2[T0,T1,TRet](CallSite site, T0 arg0, T1 arg1)
   at ASP._Page_Views_MVProject_Gallery_cshtml.Execute() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Views\MVProject\Gallery.cshtml:line 68
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


2015-09-08 15:27:34,115 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:Cannot apply indexing with [] to an expression of type 'System.Dynamic.DynamicObject'
Source:   at CallSite.Target(Closure , CallSite , Object , String )
   at System.Dynamic.UpdateDelegates.UpdateAndExecute2[T0,T1,TRet](CallSite site, T0 arg0, T1 arg1)
   at ASP._Page_Views_MVProject_Gallery_cshtml.Execute() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Views\MVProject\Gallery.cshtml:line 68
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


2015-09-09 09:59:35,474 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/
URLReferrer:
Message:Invalid object name 'cbslusr.Article'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-09 12:43:52,799 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/
URLReferrer:
Message:Invalid object name 'cbslusr.Article'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-09 13:59:28,279 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:The view 'Index' or its master was not found or no view engine supports the searched locations. The following locations were searched:
~/Areas/SHTracker/Views/MvpGallery/Index.aspx
~/Areas/SHTracker/Views/MvpGallery/Index.ascx
~/Areas/SHTracker/Views/Shared/Index.aspx
~/Areas/SHTracker/Views/Shared/Index.ascx
~/Views/MvpGallery/Index.aspx
~/Views/MvpGallery/Index.ascx
~/Views/Shared/Index.aspx
~/Views/Shared/Index.ascx
~/Areas/SHTracker/Views/MvpGallery/Index.cshtml
~/Areas/SHTracker/Views/MvpGallery/Index.vbhtml
~/Areas/SHTracker/Views/Shared/Index.cshtml
~/Areas/SHTracker/Views/Shared/Index.vbhtml
~/Views/MvpGallery/Index.cshtml
~/Views/MvpGallery/Index.vbhtml
~/Views/Shared/Index.cshtml
~/Views/Shared/Index.vbhtml
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


2015-09-09 13:59:54,540 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/index
URLReferrer:
Message:The controller for path '/SHTracker/index' was not found or does not implement IController.
Source:   at ICStars2_0.Mvc.ICStarsDependencyMvcControllerFactory.GetControllerInstance(RequestContext requestContext, Type controllerType) in c:\RahmoSource\ICStars2_0\ICStars2_0.Mvc\ICStarsDependencyMvcControllerFactory.cs:line 16
   at System.Web.Mvc.DefaultControllerFactory.CreateController(RequestContext requestContext, String controllerName)
   at System.Web.Mvc.MvcHandler.ProcessRequestInit(HttpContextBase httpContext, IController& controller, IControllerFactory& factory)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContextBase httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.BeginProcessRequest(HttpContext httpContext, AsyncCallback callback, Object state)
   at System.Web.Mvc.MvcHandler.System.Web.IHttpAsyncHandler.BeginProcessRequest(HttpContext context, AsyncCallback cb, Object extraData)
   at System.Web.HttpApplication.CallHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-09 14:41:12,407 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Details/8994dd48-bea9-44fd-9c3a-3ac21990c7f7
URLReferrer:http://localhost:8164/SHTracker/MvpGallery
Message:The argument types 'Edm.Guid' and 'Edm.Int32' are incompatible for this operation. Near WHERE predicate, line 1, column 69.
Source:   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertEqualCompArgs(BuiltInExpr astBuiltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.<CreateBuiltInExprConverter>b__83(BuiltInExpr bltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertBuiltIn(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpression(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ProcessWhereHavingClausePredicate(DbExpressionBinding source, Node predicate, ErrorContext errCtx, String bindingNameTemplate, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryExpr(Node expr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryStatementToDbExpression(Statement astStatement, SemanticResolver sr, List`1& functionDefs)
   at System.Data.Common.EntitySql.SemanticAnalyzer.AnalyzeQueryCommand(Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.<AnalyzeQueryExpressionSemantics>b__8(SemanticAnalyzer analyzer, Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeSemanticsCommon[TResult](Node astExpr, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables, Func`3 analysisFunction)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeQueryExpressionSemantics(Node astQueryCommand, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Common.EntitySql.CqlQuery.<>c__DisplayClass4.<CompileQueryCommandLambda>b__3(Node astCommand, ParserOptions validatedParserOptions)
   at System.Data.Common.EntitySql.CqlQuery.CompileCommon[TResult](String commandText, Perspective perspective, ParserOptions parserOptions, Func`3 compilationFunction)
   at System.Data.Common.EntitySql.CqlQuery.CompileQueryCommandLambda(String queryCommandText, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Objects.EntitySqlQueryState.Parse()
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateInlineQueryOfT(ObjectQuery inlineQuery)
   at System.Data.Objects.ELinq.ExpressionConverter.ConstantTranslator.TypedTranslate(ExpressionConverter parent, ConstantExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.System.Collections.Generic.IEnumerable<T>.GetEnumerator()
   at System.Linq.Enumerable.SingleOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__2[TResult](IEnumerable`1 sequence)
   at System.Data.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[S](Expression expression)
   at System.Linq.Queryable.SingleOrDefault[TSource](IQueryable`1 source)
   at System.Data.Entity.Internal.Linq.InternalSet`1.FindInStore(WrappedEntityKey key, String keyValuesParamName)


2015-09-09 14:41:13,094 [10] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Details/8994dd48-bea9-44fd-9c3a-3ac21990c7f7
URLReferrer:http://localhost:8164/SHTracker/MvpGallery
Message:The argument types 'Edm.Guid' and 'Edm.Int32' are incompatible for this operation. Near WHERE predicate, line 1, column 69.
Source:   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertEqualCompArgs(BuiltInExpr astBuiltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.<CreateBuiltInExprConverter>b__83(BuiltInExpr bltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertBuiltIn(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpression(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ProcessWhereHavingClausePredicate(DbExpressionBinding source, Node predicate, ErrorContext errCtx, String bindingNameTemplate, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryExpr(Node expr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryStatementToDbExpression(Statement astStatement, SemanticResolver sr, List`1& functionDefs)
   at System.Data.Common.EntitySql.SemanticAnalyzer.AnalyzeQueryCommand(Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.<AnalyzeQueryExpressionSemantics>b__8(SemanticAnalyzer analyzer, Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeSemanticsCommon[TResult](Node astExpr, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables, Func`3 analysisFunction)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeQueryExpressionSemantics(Node astQueryCommand, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Common.EntitySql.CqlQuery.<>c__DisplayClass4.<CompileQueryCommandLambda>b__3(Node astCommand, ParserOptions validatedParserOptions)
   at System.Data.Common.EntitySql.CqlQuery.CompileCommon[TResult](String commandText, Perspective perspective, ParserOptions parserOptions, Func`3 compilationFunction)
   at System.Data.Common.EntitySql.CqlQuery.CompileQueryCommandLambda(String queryCommandText, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Objects.EntitySqlQueryState.Parse()
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateInlineQueryOfT(ObjectQuery inlineQuery)
   at System.Data.Objects.ELinq.ExpressionConverter.ConstantTranslator.TypedTranslate(ExpressionConverter parent, ConstantExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.System.Collections.Generic.IEnumerable<T>.GetEnumerator()
   at System.Linq.Enumerable.SingleOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__2[TResult](IEnumerable`1 sequence)
   at System.Data.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[S](Expression expression)
   at System.Linq.Queryable.SingleOrDefault[TSource](IQueryable`1 source)
   at System.Data.Entity.Internal.Linq.InternalSet`1.FindInStore(WrappedEntityKey key, String keyValuesParamName)


2015-09-09 14:42:22,873 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Details/8994dd48-bea9-44fd-9c3a-3ac21990c7f7
URLReferrer:http://localhost:8164/SHTracker/MvpGallery/Index/
Message:The parameters dictionary contains a null entry for parameter 'id' of non-nullable type 'System.Int32' for method 'System.Web.Mvc.ActionResult Details(Int32)' in 'ICStars2_0.Areas.SHTracker.Controllers.MvpGalleryController'. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters
Source:   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.<>c__DisplayClass1.<Execute>b__0(ParameterInfo parameterInfo)
   at System.Linq.Enumerable.WhereSelectArrayIterator`2.MoveNext()
   at System.Linq.Buffer`1..ctor(IEnumerable`1 source)
   at System.Linq.Enumerable.ToArray[TSource](IEnumerable`1 source)
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


2015-09-09 14:44:26,709 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Details/46f99886-8663-4fc8-aa2a-607d4ccfb991
URLReferrer:http://localhost:8164/SHTracker/MvpGallery/Index/
Message:The argument types 'Edm.Guid' and 'Edm.Int32' are incompatible for this operation. Near WHERE predicate, line 1, column 69.
Source:   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertEqualCompArgs(BuiltInExpr astBuiltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.<CreateBuiltInExprConverter>b__83(BuiltInExpr bltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertBuiltIn(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpression(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ProcessWhereHavingClausePredicate(DbExpressionBinding source, Node predicate, ErrorContext errCtx, String bindingNameTemplate, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryExpr(Node expr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryStatementToDbExpression(Statement astStatement, SemanticResolver sr, List`1& functionDefs)
   at System.Data.Common.EntitySql.SemanticAnalyzer.AnalyzeQueryCommand(Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.<AnalyzeQueryExpressionSemantics>b__8(SemanticAnalyzer analyzer, Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeSemanticsCommon[TResult](Node astExpr, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables, Func`3 analysisFunction)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeQueryExpressionSemantics(Node astQueryCommand, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Common.EntitySql.CqlQuery.<>c__DisplayClass4.<CompileQueryCommandLambda>b__3(Node astCommand, ParserOptions validatedParserOptions)
   at System.Data.Common.EntitySql.CqlQuery.CompileCommon[TResult](String commandText, Perspective perspective, ParserOptions parserOptions, Func`3 compilationFunction)
   at System.Data.Common.EntitySql.CqlQuery.CompileQueryCommandLambda(String queryCommandText, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Objects.EntitySqlQueryState.Parse()
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateInlineQueryOfT(ObjectQuery inlineQuery)
   at System.Data.Objects.ELinq.ExpressionConverter.ConstantTranslator.TypedTranslate(ExpressionConverter parent, ConstantExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.System.Collections.Generic.IEnumerable<T>.GetEnumerator()
   at System.Linq.Enumerable.SingleOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__2[TResult](IEnumerable`1 sequence)
   at System.Data.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[S](Expression expression)
   at System.Linq.Queryable.SingleOrDefault[TSource](IQueryable`1 source)
   at System.Data.Entity.Internal.Linq.InternalSet`1.FindInStore(WrappedEntityKey key, String keyValuesParamName)


2015-09-09 14:47:15,765 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Edit/46f99886-8663-4fc8-aa2a-607d4ccfb991
URLReferrer:http://localhost:8164/SHTracker/MvpGallery/Index/
Message:A public action method 'Edit' was not found on controller 'ICStars2_0.Areas.SHTracker.Controllers.MvpGalleryController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
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


2015-09-09 14:47:32,398 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Edit/8994dd48-bea9-44fd-9c3a-3ac21990c7f7
URLReferrer:http://localhost:8164/SHTracker/MvpGallery/Index/
Message:A public action method 'Edit' was not found on controller 'ICStars2_0.Areas.SHTracker.Controllers.MvpGalleryController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
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


2015-09-09 14:49:31,884 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Delete/8994dd48-bea9-44fd-9c3a-3ac21990c7f7
URLReferrer:http://localhost:8164/SHTracker/MvpGallery/Index/
Message:The argument types 'Edm.Guid' and 'Edm.Int32' are incompatible for this operation. Near WHERE predicate, line 1, column 69.
Source:   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertEqualCompArgs(BuiltInExpr astBuiltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.<CreateBuiltInExprConverter>b__83(BuiltInExpr bltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertBuiltIn(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpression(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ProcessWhereHavingClausePredicate(DbExpressionBinding source, Node predicate, ErrorContext errCtx, String bindingNameTemplate, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryExpr(Node expr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryStatementToDbExpression(Statement astStatement, SemanticResolver sr, List`1& functionDefs)
   at System.Data.Common.EntitySql.SemanticAnalyzer.AnalyzeQueryCommand(Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.<AnalyzeQueryExpressionSemantics>b__8(SemanticAnalyzer analyzer, Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeSemanticsCommon[TResult](Node astExpr, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables, Func`3 analysisFunction)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeQueryExpressionSemantics(Node astQueryCommand, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Common.EntitySql.CqlQuery.<>c__DisplayClass4.<CompileQueryCommandLambda>b__3(Node astCommand, ParserOptions validatedParserOptions)
   at System.Data.Common.EntitySql.CqlQuery.CompileCommon[TResult](String commandText, Perspective perspective, ParserOptions parserOptions, Func`3 compilationFunction)
   at System.Data.Common.EntitySql.CqlQuery.CompileQueryCommandLambda(String queryCommandText, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Objects.EntitySqlQueryState.Parse()
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateInlineQueryOfT(ObjectQuery inlineQuery)
   at System.Data.Objects.ELinq.ExpressionConverter.ConstantTranslator.TypedTranslate(ExpressionConverter parent, ConstantExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.System.Collections.Generic.IEnumerable<T>.GetEnumerator()
   at System.Linq.Enumerable.SingleOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__2[TResult](IEnumerable`1 sequence)
   at System.Data.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[S](Expression expression)
   at System.Linq.Queryable.SingleOrDefault[TSource](IQueryable`1 source)
   at System.Data.Entity.Internal.Linq.InternalSet`1.FindInStore(WrappedEntityKey key, String keyValuesParamName)


2015-09-09 14:55:13,732 [5] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Details/8994dd48-bea9-44fd-9c3a-3ac21990c7f7
URLReferrer:http://localhost:8164/SHTracker/MvpGallery/Index/
Message:The argument types 'Edm.Guid' and 'Edm.Int64' are incompatible for this operation. Near WHERE predicate, line 1, column 69.
Source:   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertEqualCompArgs(BuiltInExpr astBuiltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.<CreateBuiltInExprConverter>b__83(BuiltInExpr bltInExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertBuiltIn(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpression(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ProcessWhereHavingClausePredicate(DbExpressionBinding source, Node predicate, ErrorContext errCtx, String bindingNameTemplate, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryExpr(Node expr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.Convert(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertValueExpressionAllowUntypedNulls(Node astExpr, SemanticResolver sr)
   at System.Data.Common.EntitySql.SemanticAnalyzer.ConvertQueryStatementToDbExpression(Statement astStatement, SemanticResolver sr, List`1& functionDefs)
   at System.Data.Common.EntitySql.SemanticAnalyzer.AnalyzeQueryCommand(Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.<AnalyzeQueryExpressionSemantics>b__8(SemanticAnalyzer analyzer, Node astExpr)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeSemanticsCommon[TResult](Node astExpr, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables, Func`3 analysisFunction)
   at System.Data.Common.EntitySql.CqlQuery.AnalyzeQueryExpressionSemantics(Node astQueryCommand, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Common.EntitySql.CqlQuery.<>c__DisplayClass4.<CompileQueryCommandLambda>b__3(Node astCommand, ParserOptions validatedParserOptions)
   at System.Data.Common.EntitySql.CqlQuery.CompileCommon[TResult](String commandText, Perspective perspective, ParserOptions parserOptions, Func`3 compilationFunction)
   at System.Data.Common.EntitySql.CqlQuery.CompileQueryCommandLambda(String queryCommandText, Perspective perspective, ParserOptions parserOptions, IEnumerable`1 parameters, IEnumerable`1 variables)
   at System.Data.Objects.EntitySqlQueryState.Parse()
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateInlineQueryOfT(ObjectQuery inlineQuery)
   at System.Data.Objects.ELinq.ExpressionConverter.ConstantTranslator.TypedTranslate(ExpressionConverter parent, ConstantExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.ObjectQueryMergeAsTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.UnarySequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.SequenceMethodTranslator.Translate(ExpressionConverter parent, MethodCallExpression call, SequenceMethod sequenceMethod)
   at System.Data.Objects.ELinq.ExpressionConverter.MethodCallTranslator.TypedTranslate(ExpressionConverter parent, MethodCallExpression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TypedTranslator`1.Translate(ExpressionConverter parent, Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.TranslateExpression(Expression linq)
   at System.Data.Objects.ELinq.ExpressionConverter.Convert()
   at System.Data.Objects.ELinq.ELinqQueryState.GetExecutionPlan(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.GetResults(Nullable`1 forMergeOption)
   at System.Data.Objects.ObjectQuery`1.System.Collections.Generic.IEnumerable<T>.GetEnumerator()
   at System.Linq.Enumerable.SingleOrDefault[TSource](IEnumerable`1 source)
   at System.Data.Objects.ELinq.ObjectQueryProvider.<GetElementFunction>b__2[TResult](IEnumerable`1 sequence)
   at System.Data.Objects.ELinq.ObjectQueryProvider.ExecuteSingle[TResult](IEnumerable`1 query, Expression queryRoot)
   at System.Data.Objects.ELinq.ObjectQueryProvider.System.Linq.IQueryProvider.Execute[S](Expression expression)
   at System.Linq.Queryable.SingleOrDefault[TSource](IQueryable`1 source)
   at System.Data.Entity.Internal.Linq.InternalSet`1.FindInStore(WrappedEntityKey key, String keyValuesParamName)


2015-09-09 15:04:39,254 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Details/8994dd48-bea9-44fd-9c3a-3ac21990c7f7
URLReferrer:http://localhost:8164/SHTracker/MvpGallery/Index/
Message:The parameters dictionary contains a null entry for parameter 'id' of non-nullable type 'System.Int32' for method 'System.Web.Mvc.ActionResult Details(Int32)' in 'ICStars2_0.Areas.SHTracker.Controllers.MvpGalleryController'. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters
Source:   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.<>c__DisplayClass1.<Execute>b__0(ParameterInfo parameterInfo)
   at System.Linq.Enumerable.WhereSelectArrayIterator`2.MoveNext()
   at System.Linq.Buffer`1..ctor(IEnumerable`1 source)
   at System.Linq.Enumerable.ToArray[TSource](IEnumerable`1 source)
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


2015-09-09 16:27:19,846 [9] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Index/
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:The model item passed into the dictionary is of type 'System.Collections.Generic.List`1[ICStars2_0.Model.ImageGallery]', but this dictionary requires a model item of type 'System.Collections.Generic.IEnumerable`1[ICStars2_0.Model.Organization]'.
Source:   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
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


2015-09-09 16:27:39,752 [11] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Index/
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:The model item passed into the dictionary is of type 'System.Collections.Generic.List`1[ICStars2_0.Model.ImageGallery]', but this dictionary requires a model item of type 'System.Collections.Generic.IEnumerable`1[ICStars2_0.Model.Organization]'.
Source:   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
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


2015-09-09 16:27:40,038 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Index/
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:The model item passed into the dictionary is of type 'System.Collections.Generic.List`1[ICStars2_0.Model.ImageGallery]', but this dictionary requires a model item of type 'System.Collections.Generic.IEnumerable`1[ICStars2_0.Model.Organization]'.
Source:   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
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


2015-09-09 16:27:45,838 [9] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpGallery/Index/
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:The model item passed into the dictionary is of type 'System.Collections.Generic.List`1[ICStars2_0.Model.ImageGallery]', but this dictionary requires a model item of type 'System.Collections.Generic.IEnumerable`1[ICStars2_0.Model.Organization]'.
Source:   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
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


2015-09-09 17:18:38,329 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/MVProject/Gallery
URLReferrer:
Message:Invalid object name 'cbslusr.WebPage'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-09 17:18:38,345 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/
URLReferrer:
Message:Invalid object name 'cbslusr.Article'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-11 00:47:43,378 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=&SearchText=Areli
URLReferrer:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=&SearchText=
Message:Object reference not set to an instance of an object.
Source:   at System.Web.Security.Roles.GetRolesForUser(String username)
   at System.Web.Security.Roles.GetRolesForUser()
   at ICStars2_0.Framework.ICStars2_0PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path) in c:\RahmoSource\ICStars2_0\ICStars2_0.Framework\ICStars2_0PageHandlerFactory.cs:line 62
   at System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-11 00:48:04,882 [15] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=1&SearchText=Areli
URLReferrer:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=&SearchText=
Message:Object reference not set to an instance of an object.
Source:   at System.Web.Security.Roles.GetRolesForUser(String username)
   at System.Web.Security.Roles.GetRolesForUser()
   at ICStars2_0.Framework.ICStars2_0PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path) in c:\RahmoSource\ICStars2_0\ICStars2_0.Framework\ICStars2_0PageHandlerFactory.cs:line 62
   at System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-11 00:48:04,883 [5] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=&SearchText=Areli
URLReferrer:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=&SearchText=
Message:Object reference not set to an instance of an object.
Source:   at System.Web.Security.Roles.GetRolesForUser(String username)
   at System.Web.Security.Roles.GetRolesForUser()
   at ICStars2_0.Framework.ICStars2_0PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path) in c:\RahmoSource\ICStars2_0\ICStars2_0.Framework\ICStars2_0PageHandlerFactory.cs:line 62
   at System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-11 00:48:04,913 [11] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=&SearchText=Areli
URLReferrer:http://localhost:8164/ShTracker/Account/MemberManagement.aspx?SearchType=&SearchText=
Message:Object reference not set to an instance of an object.
Source:   at System.Web.Security.Roles.GetRolesForUser(String username)
   at ASP.shtracker_account_membermanagement_aspx.__DataBind__control7(Object sender, EventArgs e) in c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx:line 133
   at System.Web.UI.Control.OnDataBinding(EventArgs e)
   at System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   at System.Web.UI.Control.DataBind()
   at System.Web.UI.Control.DataBindChildren()
   at System.Web.UI.Control.DataBind(Boolean raiseOnDataBinding)
   at System.Web.UI.Control.DataBind()
   at System.Web.UI.WebControls.Repeater.CreateItem(Int32 itemIndex, ListItemType itemType, Boolean dataBind, Object dataItem)
   at System.Web.UI.WebControls.Repeater.CreateControlHierarchy(Boolean useDataSource)
   at System.Web.UI.WebControls.Repeater.OnDataBinding(EventArgs e)
   at System.Web.UI.WebControls.Repeater.DataBind()
   at ICStars2_0.SHTracker.Account.MemberManagement.Page_Load(Object sender, EventArgs e) in c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx.cs:line 88
   at System.Web.Util.CalliEventHandlerDelegateProxy.Callback(Object sender, EventArgs e)
   at System.Web.UI.Control.OnLoad(EventArgs e)
   at System.Web.UI.Control.LoadRecursive()
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)


2015-09-11 01:06:43,133 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64; Trident/7.0; rv:11.0) like Gecko
URL:http://localhost:8164/Account/Login?ReturnUrl=/SHTracker/Account/MemberManagement.aspx
URLReferrer:
Message:Exception of type 'System.OutOfMemoryException' was thrown.
Source:   at ASP._Page_Views_Shared_Header_cshtml.Execute()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.Mvc.RazorView.RenderView(ViewContext viewContext, TextWriter writer, Object instance)
   at System.Web.Mvc.BuildManagerCompiledView.Render(ViewContext viewContext, TextWriter writer)
   at System.Web.Mvc.HtmlHelper.RenderPartialInternal(String partialViewName, ViewDataDictionary viewData, Object model, TextWriter writer, ViewEngineCollection viewEngineCollection)
   at System.Web.Mvc.Html.PartialExtensions.Partial(HtmlHelper htmlHelper, String partialViewName, Object model, ViewDataDictionary viewData)
   at System.Web.Mvc.Html.PartialExtensions.Partial(HtmlHelper htmlHelper, String partialViewName)
   at ASP._Page_Views_Shared__Layout_cshtml.Execute() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Views\Shared\_Layout.cshtml:line 29
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy(WebPageContext pageContext, TextWriter writer, WebPageRenderingBase startPage)
   at System.Web.WebPages.WebPageBase.<>c__DisplayClass7.<RenderPageCore>b__6(TextWriter writer)
   at System.Web.WebPages.HelperResult.WriteTo(TextWriter writer)
   at System.Web.WebPages.WebPageBase.Write(HelperResult result)
   at System.Web.WebPages.WebPageBase.RenderSurrounding(String partialViewName, Action`1 body)
   at System.Web.WebPages.WebPageBase.PopContext()
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


2015-09-11 01:12:00,104 [9] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx
URLReferrer:
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx(96): error CS1061: 'ASP.shtracker_account_membermanagement_aspx' does not contain a definition for 'BtnSearch' and no extension method 'BtnSearch' accepting a first argument of type 'ASP.shtracker_account_membermanagement_aspx' could be found (are you missing a using directive or an assembly reference?)
Source:   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   at System.Web.UI.PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   at ICStars2_0.Framework.ICStars2_0PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path) in c:\RahmoSource\ICStars2_0\ICStars2_0.Framework\ICStars2_0PageHandlerFactory.cs:line 23
   at System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-11 01:45:20,604 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx(96): error CS1061: 'ASP.shtracker_account_membermanagement_aspx' does not contain a definition for 'BtnSearch' and no extension method 'BtnSearch' accepting a first argument of type 'ASP.shtracker_account_membermanagement_aspx' could be found (are you missing a using directive or an assembly reference?)
Source:   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   at System.Web.UI.PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   at ICStars2_0.Framework.ICStars2_0PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path) in c:\RahmoSource\ICStars2_0\ICStars2_0.Framework\ICStars2_0PageHandlerFactory.cs:line 23
   at System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-11 01:47:24,274 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx(96): error CS1061: 'ASP.shtracker_account_membermanagement_aspx' does not contain a definition for 'BtnSearch' and no extension method 'BtnSearch' accepting a first argument of type 'ASP.shtracker_account_membermanagement_aspx' could be found (are you missing a using directive or an assembly reference?)
Source:   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   at System.Web.UI.PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   at ICStars2_0.Framework.ICStars2_0PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path) in c:\RahmoSource\ICStars2_0\ICStars2_0.Framework\ICStars2_0PageHandlerFactory.cs:line 23
   at System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-11 01:49:46,282 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/ShTracker/Account/MemberManagement.aspx
URLReferrer:
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx(96): error CS1061: 'ASP.shtracker_account_membermanagement_aspx' does not contain a definition for 'BtnSearch' and no extension method 'BtnSearch' accepting a first argument of type 'ASP.shtracker_account_membermanagement_aspx' could be found (are you missing a using directive or an assembly reference?)
Source:   at System.Web.Compilation.BuildManager.CompileWebFile(VirtualPath virtualPath)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultInternal(VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVPathBuildResultWithNoAssert(HttpContext context, VirtualPath virtualPath, Boolean noBuild, Boolean allowCrossApp, Boolean allowBuildInPrecompile, Boolean throwIfNotFound, Boolean ensureIsUpToDate)
   at System.Web.Compilation.BuildManager.GetVirtualPathObjectFactory(VirtualPath virtualPath, HttpContext context, Boolean allowCrossApp, Boolean throwIfNotFound)
   at System.Web.Compilation.BuildManager.CreateInstanceFromVirtualPath(VirtualPath virtualPath, Type requiredBaseType, HttpContext context, Boolean allowCrossApp)
   at System.Web.UI.PageHandlerFactory.GetHandlerHelper(HttpContext context, String requestType, VirtualPath virtualPath, String physicalPath)
   at System.Web.UI.PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path)
   at ICStars2_0.Framework.ICStars2_0PageHandlerFactory.GetHandler(HttpContext context, String requestType, String virtualPath, String path) in c:\GitRahmoSource\ICStars2_0\ICStars2_0.Framework\ICStars2_0PageHandlerFactory.cs:line 23
   at System.Web.HttpApplication.MaterializeHandlerExecutionStep.System.Web.HttpApplication.IExecutionStep.Execute()
   at System.Web.HttpApplication.ExecuteStep(IExecutionStep step, Boolean& completedSynchronously)


2015-09-11 10:21:57,466 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/Account/Login?ReturnUrl=/SHTracker/Account/MemberManagement.aspx
URLReferrer:
Message:Invalid object name 'cbslusr.WebsiteNav'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-11 10:58:58,061 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/Account/MemberManagement.aspx?SearchType=3&SearchText=AALZAH13
URLReferrer:http://localhost:8164/SHTracker/Account/MemberManagement.aspx?SearchType=3&SearchText=AALZAH13
Message:The 'LastLoginDate' property on 'BaseMember' could not be set to a 'null' value. You must set this property to a non-null value of type 'DateTime'. 
Source:   at System.Data.Common.Internal.Materialization.Shaper.ErrorHandlingValueReader`1.GetValue(DbDataReader reader, Int32 ordinal)
   at System.Data.Common.Internal.Materialization.Shaper.GetPropertyValueWithErrorHandling[TProperty](Int32 ordinal, String propertyName, String typeName)
   at lambda_method(Closure , Shaper )
   at System.Data.Common.Internal.Materialization.Shaper.HandleEntityAppendOnly[TEntity](Func`2 constructEntityDelegate, EntityKey entityKey, EntitySet entitySet)
   at lambda_method(Closure , Shaper )
   at System.Data.Common.Internal.Materialization.Coordinator`1.ReadNextElement(Shaper shaper)
   at System.Data.Common.Internal.Materialization.Shaper`1.SimpleEnumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at ICStars2_0.SHTracker.Account.MemberManagement.BtnSearch(Object sender, EventArgs e) in c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx.cs:line 126
   at System.Web.UI.WebControls.LinkButton.OnClick(EventArgs e)
   at System.Web.UI.WebControls.LinkButton.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.WebControls.LinkButton.System.Web.UI.IPostBackEventHandler.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(IPostBackEventHandler sourceControl, String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(NameValueCollection postData)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)


2015-09-15 14:10:04,106 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/Account/Login?ReturnUrl=/SHTracker/Account/MemberManagement.aspx
URLReferrer:
Message:Invalid object name 'dbo.WebsiteNav'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-15 14:18:31,785 [5] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/Account/Login?ReturnUrl=/SHTracker/Account/MemberManagement.aspx
URLReferrer:
Message:Invalid object name 'dbo.WebsiteNav'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-15 15:24:26,889 [27] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/Account/Login?ReturnUrl=/ShTracker/Account/MemberManagement.aspx
URLReferrer:http://localhost:8164/SHTracker/Left.aspx
Message:Invalid object name 'dbo.WebsiteNav'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-15 15:24:56,057 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/
URLReferrer:
Message:Invalid object name 'dbo.Article'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-15 15:57:05,197 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/SHTracker/Account/MemberManagement.aspx?SearchType=3&SearchText=cweinga1
URLReferrer:http://localhost:8164/SHTracker/Account/MemberManagement.aspx?SearchType=3&SearchText=cweinga1
Message:The 'LastLoginDate' property on 'BaseMember' could not be set to a 'null' value. You must set this property to a non-null value of type 'DateTime'. 
Source:   at System.Data.Common.Internal.Materialization.Shaper.ErrorHandlingValueReader`1.GetValue(DbDataReader reader, Int32 ordinal)
   at System.Data.Common.Internal.Materialization.Shaper.GetPropertyValueWithErrorHandling[TProperty](Int32 ordinal, String propertyName, String typeName)
   at lambda_method(Closure , Shaper )
   at System.Data.Common.Internal.Materialization.Shaper.HandleEntityAppendOnly[TEntity](Func`2 constructEntityDelegate, EntityKey entityKey, EntitySet entitySet)
   at lambda_method(Closure , Shaper )
   at System.Data.Common.Internal.Materialization.Coordinator`1.ReadNextElement(Shaper shaper)
   at System.Data.Common.Internal.Materialization.Shaper`1.SimpleEnumerator.MoveNext()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at ICStars2_0.SHTracker.Account.MemberManagement.BtnSearch(Object sender, EventArgs e) in c:\GitRahmoSource\ICStars2_0\ICStars2_0\SHTracker\Account\MemberManagement.aspx.cs:line 126
   at System.Web.UI.WebControls.LinkButton.OnClick(EventArgs e)
   at System.Web.UI.WebControls.LinkButton.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.WebControls.LinkButton.System.Web.UI.IPostBackEventHandler.RaisePostBackEvent(String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(IPostBackEventHandler sourceControl, String eventArgument)
   at System.Web.UI.Page.RaisePostBackEvent(NameValueCollection postData)
   at System.Web.UI.Page.ProcessRequestMain(Boolean includeStagesBeforeAsyncPoint, Boolean includeStagesAfterAsyncPoint)


2015-09-16 13:58:16,358 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36
URL:http://localhost:8164/
URLReferrer:
Message:Invalid object name 'cbslusr.Article'.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlDataReader.TryConsumeMetaData()
   at System.Data.SqlClient.SqlDataReader.get_MetaData()
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteReader(CommandBehavior behavior, String method)
   at System.Data.SqlClient.SqlCommand.ExecuteDbDataReader(CommandBehavior behavior)
   at System.Data.Common.DbCommand.ExecuteReader(CommandBehavior behavior)
   at System.Data.EntityClient.EntityCommandDefinition.ExecuteStoreCommands(EntityCommand entityCommand, CommandBehavior behavior)


2015-09-18 08:35:46,244 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpResources/Index
URLReferrer:
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\Areas\SHTracker\Views\MvpResources\Index.cshtml(52): error CS1061: 'ICStars2_0.Model.MvpResource' does not contain a definition for 'OrgId' and no extension method 'OrgId' accepting a first argument of type 'ICStars2_0.Model.MvpResource' could be found (are you missing a using directive or an assembly reference?)
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-09-18 08:52:55,103 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpResources
URLReferrer:http://localhost:8164/SHTracker/MvpResources/Create
Message:Object reference not set to an instance of an object.
Source:   at System.Data.Entity.Internal.RetryLazy`2.GetValue(TInput input)
   at System.Data.Entity.Internal.LazyInternalContext.InitializeContext()
   at System.Data.Entity.Internal.InternalContext.Initialize()
   at System.Data.Entity.Internal.InternalContext.GetEntitySetAndBaseTypeForType(Type entityType)
   at System.Data.Entity.Internal.Linq.InternalSet`1.Initialize()
   at System.Data.Entity.Internal.Linq.InternalSet`1.GetEnumerator()
   at System.Data.Entity.Infrastructure.DbQuery`1.System.Collections.Generic.IEnumerable<TResult>.GetEnumerator()
   at System.Collections.Generic.List`1..ctor(IEnumerable`1 collection)
   at System.Linq.Enumerable.ToList[TSource](IEnumerable`1 source)
   at ICStars2_0.Areas.SHTracker.Controllers.MvpResourcesController.Index() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Areas\SHTracker\Controllers\MvpResourcesController.cs:line 21
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


2015-09-18 09:13:31,127 [13] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpResources/Edit/2
URLReferrer:http://localhost:8164/SHTracker/MvpResources/Edit/2
Message:The conversion of a datetime2 data type to a datetime data type resulted in an out-of-range value.
The statement has been terminated.
Source:   at System.Data.SqlClient.SqlConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.SqlInternalConnection.OnError(SqlException exception, Boolean breakConnection, Action`1 wrapCloseInAction)
   at System.Data.SqlClient.TdsParser.ThrowExceptionAndWarning(TdsParserStateObject stateObj, Boolean callerHasConnectionLock, Boolean asyncClose)
   at System.Data.SqlClient.TdsParser.TryRun(RunBehavior runBehavior, SqlCommand cmdHandler, SqlDataReader dataStream, BulkCopySimpleResultSet bulkCopyHandler, TdsParserStateObject stateObj, Boolean& dataReady)
   at System.Data.SqlClient.SqlCommand.FinishExecuteReader(SqlDataReader ds, RunBehavior runBehavior, String resetOptionsString)
   at System.Data.SqlClient.SqlCommand.RunExecuteReaderTds(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, Boolean async, Int32 timeout, Task& task, Boolean asyncWrite, SqlDataReader ds)
   at System.Data.SqlClient.SqlCommand.RunExecuteReader(CommandBehavior cmdBehavior, RunBehavior runBehavior, Boolean returnStream, String method, TaskCompletionSource`1 completion, Int32 timeout, Task& task, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.InternalExecuteNonQuery(TaskCompletionSource`1 completion, String methodName, Boolean sendToPipe, Int32 timeout, Boolean asyncWrite)
   at System.Data.SqlClient.SqlCommand.ExecuteNonQuery()
   at System.Data.Mapping.Update.Internal.DynamicUpdateCommand.Execute(UpdateTranslator translator, EntityConnection connection, Dictionary`2 identifierValues, List`1 generatedValues)
   at System.Data.Mapping.Update.Internal.UpdateTranslator.Update(IEntityStateManager stateManager, IEntityAdapter adapter)


2015-09-18 09:29:22,601 [20] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpResources/Create
URLReferrer:http://localhost:8164/SHTracker/MvpResources
Message:c:\GitRahmoSource\ICStars2_0\ICStars2_0\Areas\SHTracker\Views\MvpResources\Create.cshtml(39): error CS1061: 'ICStars2_0.Model.MvpResource' does not contain a definition for 'Color' and no extension method 'Color' accepting a first argument of type 'ICStars2_0.Model.MvpResource' could be found (are you missing a using directive or an assembly reference?)
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-09-18 09:56:24,491 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpResources/Create
URLReferrer:
Message:Expected "}".

Source:   at System.Web.WebPages.Razor.RazorBuildProvider.EnsureGeneratedCode()
   at System.Web.WebPages.Razor.RazorBuildProvider.get_CodeCompilerType()
   at System.Web.Compilation.BuildProvider.GetCompilerTypeFromBuildProvider(BuildProvider buildProvider)
   at System.Web.Compilation.BuildProvidersCompiler.ProcessBuildProviders()
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
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPathFromGeneralName(ControllerContext controllerContext, List`1 locations, String name, String controllerName, String areaName, String cacheKey, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.GetPath(ControllerContext controllerContext, String[] locations, String[] areaLocations, String locationsPropertyName, String name, String controllerName, String cacheKeyPrefix, Boolean useCache, String[]& searchedLocations)
   at System.Web.Mvc.VirtualPathProviderViewEngine.FindView(ControllerContext controllerContext, String viewName, String masterName, Boolean useCache)
   at System.Web.Mvc.ViewEngineCollection.<>c__DisplayClassc.<FindView>b__b(IViewEngine e)
   at System.Web.Mvc.ViewEngineCollection.Find(Func`2 lookup, Boolean trackSearchedPaths)
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


2015-09-18 09:57:56,341 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:AALZAH13
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/SHTracker/MvpResources/Create
URLReferrer:
Message:The partial view 'CreateHeaderPartial' was not found or no view engine supports the searched locations. The following locations were searched:
~/Areas/SHTracker/Views/MvpResources/CreateHeaderPartial.aspx
~/Areas/SHTracker/Views/MvpResources/CreateHeaderPartial.ascx
~/Areas/SHTracker/Views/Shared/CreateHeaderPartial.aspx
~/Areas/SHTracker/Views/Shared/CreateHeaderPartial.ascx
~/Views/MvpResources/CreateHeaderPartial.aspx
~/Views/MvpResources/CreateHeaderPartial.ascx
~/Views/Shared/CreateHeaderPartial.aspx
~/Views/Shared/CreateHeaderPartial.ascx
~/Areas/SHTracker/Views/MvpResources/CreateHeaderPartial.cshtml
~/Areas/SHTracker/Views/MvpResources/CreateHeaderPartial.vbhtml
~/Areas/SHTracker/Views/Shared/CreateHeaderPartial.cshtml
~/Areas/SHTracker/Views/Shared/CreateHeaderPartial.vbhtml
~/Views/MvpResources/CreateHeaderPartial.cshtml
~/Views/MvpResources/CreateHeaderPartial.vbhtml
~/Views/Shared/CreateHeaderPartial.cshtml
~/Views/Shared/CreateHeaderPartial.vbhtml
Source:   at System.Web.Mvc.HtmlHelper.FindPartialView(ViewContext viewContext, String partialViewName, ViewEngineCollection viewEngineCollection)
   at System.Web.Mvc.HtmlHelper.RenderPartialInternal(String partialViewName, ViewDataDictionary viewData, Object model, TextWriter writer, ViewEngineCollection viewEngineCollection)
   at System.Web.Mvc.Html.PartialExtensions.Partial(HtmlHelper htmlHelper, String partialViewName, Object model, ViewDataDictionary viewData)
   at System.Web.Mvc.Html.PartialExtensions.Partial(HtmlHelper htmlHelper, String partialViewName)
   at ASP._Page_Areas_SHTracker_Views_MvpResources_Create_cshtml.Execute() in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Areas\SHTracker\Views\MvpResources\Create.cshtml:line 9
   at System.Web.WebPages.WebPageBase.ExecutePageHierarchy()
   at System.Web.Mvc.WebViewPage.ExecutePageHierarchy()
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


2015-09-22 13:27:55,290 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/MVProject/Resources
URLReferrer:
Message:The parameters dictionary contains a null entry for parameter 'id' of non-nullable type 'System.Int32' for method 'System.Web.Mvc.ActionResult Resources(Int32)' in 'ICStars2_0.Controllers.MvProjectController'. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters
Source:   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.<>c__DisplayClass1.<Execute>b__0(ParameterInfo parameterInfo)
   at System.Linq.Enumerable.WhereSelectArrayIterator`2.MoveNext()
   at System.Linq.Buffer`1..ctor(IEnumerable`1 source)
   at System.Linq.Enumerable.ToArray[TSource](IEnumerable`1 source)
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


2015-09-22 13:29:18,579 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/MVProject/Resources
URLReferrer:
Message:The parameters dictionary contains a null entry for parameter 'id' of non-nullable type 'System.Int32' for method 'System.Web.Mvc.ActionResult Resources(Int32)' in 'ICStars2_0.Controllers.MvProjectController'. An optional parameter must be a reference type, a nullable type, or be declared as an optional parameter.
Parameter name: parameters
Source:   at System.Web.Mvc.ActionDescriptor.ExtractParameterFromDictionary(ParameterInfo parameterInfo, IDictionary`2 parameters, MethodInfo methodInfo)
   at System.Web.Mvc.ReflectedActionDescriptor.<>c__DisplayClass1.<Execute>b__0(ParameterInfo parameterInfo)
   at System.Linq.Enumerable.WhereSelectArrayIterator`2.MoveNext()
   at System.Linq.Buffer`1..ctor(IEnumerable`1 source)
   at System.Linq.Enumerable.ToArray[TSource](IEnumerable`1 source)
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


2015-09-22 13:30:23,738 [6] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/MVProject/Resources
URLReferrer:
Message:The model item passed into the dictionary is of type 'System.Collections.Generic.List`1[ICStars2_0.Model.MvpResource]', but this dictionary requires a model item of type 'ICStars2_0.Model.MvpResource'.
Source:   at System.Web.Mvc.ViewDataDictionary`1.SetModel(Object value)
   at System.Web.Mvc.ViewDataDictionary..ctor(ViewDataDictionary dictionary)
   at System.Web.Mvc.WebViewPage`1.SetViewData(ViewDataDictionary viewData)
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


2015-09-23 14:51:26,824 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/MVProject/Resources
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
   at ICStars2_0.Controllers.MvProjectController.Resources(String sortOrder, String currentFilter, String searchString, Nullable`1 page) in c:\GitRahmoSource\ICStars2_0\ICStars2_0\Controllers\MvProjectController.cs:line 109
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


2015-09-23 14:56:12,842 [7] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/MVProject/Index?page=2
URLReferrer:http://localhost:8164/MVProject/Resources
Message:A public action method 'Index' was not found on controller 'ICStars2_0.Controllers.MvProjectController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
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


2015-09-23 14:56:49,637 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/MVProject/Index?page=2
URLReferrer:http://localhost:8164/MVProject/Resources
Message:A public action method 'Index' was not found on controller 'ICStars2_0.Controllers.MvProjectController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
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


2015-09-23 14:58:09,638 [8] ERROR ICStars2_0.Global [(null)] - 
UserName:
IP:::1
UserAgent:Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36
URL:http://localhost:8164/MVProject/Index?page=2
URLReferrer:http://localhost:8164/MVProject/Resources
Message:A public action method 'Index' was not found on controller 'ICStars2_0.Controllers.MvProjectController'.
Source:   at System.Web.Mvc.Controller.HandleUnknownAction(String actionName)
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
