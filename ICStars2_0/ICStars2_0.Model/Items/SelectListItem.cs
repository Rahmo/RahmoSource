namespace ICStars2_0.Model.Items
{
    public class SelectListItem
    {
        private bool _selected;

        public bool Selected
        {
            get { return _selected; }
            set { _selected = value; }
        }
        private string _text;

        public string Text
        {
            get { return _text; }
            set { _text = value; }
        }
        private string _value;

        public string Value
        {
            get { return _value; }
            set { _value = value; }
        }
        public SelectListItem()
        {
        }

        public SelectListItem(string text, string value, bool seleted)
        {
            Text = text;
            Value = value;
            Selected = seleted;
        }
    }
}
