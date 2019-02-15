Imports System
Imports System.Web.UI
Imports DevExpress.XtraPivotGrid

Namespace ASPxPivotGrid_GroupFilter
	Partial Public Class _Default
		Inherits Page

		Protected Sub ASPxRadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As EventArgs)
			Dim group As PivotGridGroup = ASPxPivotGrid1.Groups(0)
			group.FilterValues.Reset()
			Select Case ASPxRadioButtonList1.SelectedIndex
				Case 0
					group.FilterValues.FilterType = PivotFilterType.Excluded
					fieldShippedYear.ExpandAll()
					fieldShippedMonth.ExpandAll()
				Case 1
					group.FilterValues.FilterType = PivotFilterType.Included
					group.FilterValues.Values.Add(1994).ChildValues.Add(12)
					group.FilterValues.Values.Add(1995).ChildValues.Add(1)
					fieldShippedYear.ExpandAll()
					fieldShippedMonth.CollapseAll()
				Case 2
					group.FilterValues.FilterType = PivotFilterType.Excluded
					group.FilterValues.Values.Add(1994)
					fieldShippedYear.CollapseAll()
					fieldShippedMonth.CollapseAll()
				Case 3
					group.FilterValues.FilterType = PivotFilterType.Included
					SelectFirstDays(group)
					fieldShippedYear.ExpandAll()
					fieldShippedMonth.ExpandAll()
			End Select
		End Sub
		Private Sub SelectFirstDays(ByVal group As PivotGridGroup)
			For Each year As Object In group.GetUniqueValues(Nothing)
				Dim value As PivotGroupFilterValue = group.FilterValues.Values.Add(year)
				For Each month As Object In group.GetUniqueValues(New Object() { year })
					value.ChildValues.Add(month).ChildValues.Add(1)
				Next month
			Next year
		End Sub
	End Class
End Namespace
