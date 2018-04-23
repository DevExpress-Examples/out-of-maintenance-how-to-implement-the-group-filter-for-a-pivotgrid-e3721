using System;
using System.Web.UI;
using DevExpress.XtraPivotGrid;

namespace ASPxPivotGrid_GroupFilter {
    public partial class _Default : Page {
        protected void ASPxRadioButtonList1_SelectedIndexChanged(object sender, EventArgs e) {
            PivotGridGroup group = ASPxPivotGrid1.Groups[0];
            group.FilterValues.Reset();
            switch (ASPxRadioButtonList1.SelectedIndex) {
                case 0:
                    group.FilterValues.FilterType = PivotFilterType.Excluded;
                    fieldShippedYear.ExpandAll();
                    fieldShippedMonth.ExpandAll();
                    break;
                case 1:
                    group.FilterValues.FilterType = PivotFilterType.Included;
                    group.FilterValues.Values.Add(1994).ChildValues.Add(12);
                    group.FilterValues.Values.Add(1995).ChildValues.Add(1);
                    fieldShippedYear.ExpandAll();
                    fieldShippedMonth.CollapseAll();
                    break;
                case 2:
                    group.FilterValues.FilterType = PivotFilterType.Excluded;
                    group.FilterValues.Values.Add(1994);
                    fieldShippedYear.CollapseAll();
                    fieldShippedMonth.CollapseAll();
                    break;
                case 3:
                    group.FilterValues.FilterType = PivotFilterType.Included;
                    SelectFirstDays(group);
                    fieldShippedYear.ExpandAll();
                    fieldShippedMonth.ExpandAll();
                    break;
            }
        }
        void SelectFirstDays(PivotGridGroup group) {
            foreach (object year in group.GetUniqueValues(null)) {
                PivotGroupFilterValue value = group.FilterValues.Values.Add(year);
                foreach (object month in group.GetUniqueValues(new object[] { year })) {
                    value.ChildValues.Add(month).ChildValues.Add(1);
                }
            }
        }
    }
}
