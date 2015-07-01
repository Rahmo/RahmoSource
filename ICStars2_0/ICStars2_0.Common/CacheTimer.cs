
using System;
using System.ComponentModel;
using System.Web;
using System.Web.Caching;

namespace ICStars2_0.Common
{

        /// <summary>
        /// 缓存定时器事件委托
        /// created by lihui 20100702
        /// </summary>
        public delegate void CacheTimerEventsHandler(object sender, CacheTimerEventsArgs e);
        /// <summary>
        /// 缓存定时器事件参数
        /// created by lihui 20100702
        /// </summary>
        public sealed class CacheTimerEventsArgs : EventArgs
        {
            public CacheTimer Timer { get; set; }

            #region = Constructor =

            public CacheTimerEventsArgs(CacheTimer timer)
            {
                Timer = timer;
            }

            #endregion
        }
        /// <summary>
        /// 缓存定时器
        /// created by lihui 20100702
        /// </summary>
        public class CacheTimer : Component
        {
            /// <summary>
            /// CacheTimer关键字
            /// </summary>
            public string Key { get; set; }
            /// <summary>
            /// CacheTimer值
            /// </summary>
            public object Value { get; set; }
            /// <summary>
            /// 频率(间隔以秒为单位)
            /// </summary>
            public int IntervalSeconds { get; set; }
            /// <summary>
            /// 开始时间，小时
            /// 从当天开始计算
            /// </summary>
            public int BeginHour { get; set; }
            /// <summary>
            /// 开始时间，分钟
            /// 从当天开始计算
            /// </summary>
            public int BeginMinute { get; set; }
            /// <summary>
            /// 下一次执行时间
            /// </summary>
            public DateTime NextExecuteTime { get; set; }
            /// <summary>
            /// 是否是第一次执行
            /// </summary>
            private bool _isFirstTime = true;
            /// <summary>
            /// 获取当前Cache
            /// </summary>
            public static Cache CurrentCache
            {
                get
                {
                    var context = HttpContext.Current;
                    return context != null ? context.Cache : HttpRuntime.Cache;
                }
            }
            #region =Event=

            private static readonly object _executing = new object();
            /// <summary>
            /// 定时器按频率所执行的事件
            /// </summary>
            public event CacheTimerEventsHandler Executing
            {
                add
                {
                    this.Events.AddHandler(_executing, value);
                }
                remove
                {
                    this.Events.RemoveHandler(_executing, value);
                }
            }
            #endregion

            /// <summary>
            /// 构造
            /// </summary>
            /// <param name="key">Cache关键字</param>
            /// <param name="value">Cache值</param>
            /// <param name="intervalSeconds">频率(间隔以秒为单位)</param>
            /// <param name="beginHour">开始时间，小时</param>
            /// <param name="beginMinute">开始时间，分钟</param>
            public CacheTimer(string key, object value, int intervalSeconds, int beginHour, int beginMinute)
            {
                Key = key;
                Value = value;
                BeginHour = beginHour;
                BeginMinute = beginMinute;
                IntervalSeconds = intervalSeconds;
            }
            /// <summary>
            /// 获取缓存定时器
            /// </summary>
            /// <param name="key">Cache关键字</param>
            /// <returns>缓存定时器</returns>
            public static CacheTimer GetTimer(string key)
            {
                if (CurrentCache[key] == null)
                    return null;
                return (CacheTimer)CurrentCache[key];
            }
            /// <summary>
            /// 当缓存不存在的时候则注册该缓存
            /// </summary>
            public void Start()
            {
                if (CurrentCache[Key] != null)
                    return;
                //计算下次运行时间
                NextExecuteTime = BuildNextExecuteTime();
                CurrentCache.Add(Key, this, null,
                                              NextExecuteTime,
                                              Cache.NoSlidingExpiration,
                                              CacheItemPriority.NotRemovable,
                                              CacheOnRemoved);
            }
            /// <summary>
            /// 计算Cache过期时间，即事件开始运行时间
            /// </summary>
            /// <returns>下一次执行时间</returns>
            private DateTime BuildNextExecuteTime()
            {
                if (!_isFirstTime)
                    return DateTime.Now.AddSeconds(IntervalSeconds);
                _isFirstTime = false;
                var beginSeconds = BeginHour * 60 * 60 + BeginMinute * 60;
                var nowSeconds = DateTime.Now.Hour * 60 * 60 + DateTime.Now.Minute * 60;
                if (beginSeconds <= nowSeconds)
                {
                    while (beginSeconds <= nowSeconds)
                    {
                        beginSeconds += IntervalSeconds;
                    }
                }
                else
                {
                    beginSeconds += IntervalSeconds;
                }
                var todayZero = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
                return todayZero.AddSeconds(beginSeconds);
            }

            /// <summary>
            /// 停止定时器，删除缓存
            /// </summary>
            public void Stop()
            {
                if (CurrentCache[Key] == null)
                    return;
                ((CacheTimer)CurrentCache[Key]).Value = null;
                RemoveExecutingHandler();
                CurrentCache.Remove(Key);
                _isFirstTime = true;
            }

            /// <summary>
            /// 缓存过期的回调函数
            /// </summary>
            /// <param name="key">缓存的名字</param>
            /// <param name="value">缓存的值</param>
            /// <param name="reason">缓存销毁原因</param>
            protected void CacheOnRemoved(string key, object value, CacheItemRemovedReason reason)
            {
                if (!key.Equals(Key))
                {
                    return;
                }
                if (reason != CacheItemRemovedReason.Expired)
                    return;
                if (((CacheTimer)value).Value == null)
                    return;
                OnExecuting(new CacheTimerEventsArgs(this));
                Start();

            }
            /// <summary>
            /// 定时器在频率中执行触发的事件
            /// </summary>
            /// <param name="e">定时器事件</param>
            protected void OnExecuting(CacheTimerEventsArgs e)
            {
                var handler = (CacheTimerEventsHandler)this.Events[_executing];
                if (handler != null)
                {
                    handler(this, e);
                }
            }
            /// <summary>
            /// 移除事件绑定
            /// </summary>
            protected void RemoveExecutingHandler()
            {
                var handler = (CacheTimerEventsHandler)this.Events[_executing];
                if (handler != null)
                {
                    this.Executing -= handler;
                }
            }
        }
    

}
