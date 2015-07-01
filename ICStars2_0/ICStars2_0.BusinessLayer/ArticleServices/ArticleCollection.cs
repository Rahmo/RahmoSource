﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.ArticleServices
{
    class ArticleCollection : IArticleCollection
    {
        public IEnumerator<Article> GetEnumerator()
        {
            return _articles.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return _articles.GetEnumerator();
        }

        public int TotalCount { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }

        private readonly IEnumerable<Article> _articles;
        private IQueryable<Storyboard> queryable;
        private int p;
        public ArticleCollection(IEnumerable<Article> articles, int count)
        {
            _articles = articles;
            TotalCount = count;
        }

        public ArticleCollection(IQueryable<Storyboard> queryable, int p)
        {
            // TODO: Complete member initialization
            this.queryable = queryable;
            this.p = p;
        }
    }
}
