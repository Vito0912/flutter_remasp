/*
Copyright (c) 2017, Norman Sutatyo
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. 
 */
 
package remasp.view;

import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.AbstractTableModel;
import java.awt.Dimension;
import java.awt.GridLayout;

import java.awt.Color;
import java.awt.Component;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.EventObject;
import java.util.List;

import javax.swing.*;
import javax.swing.event.CellEditorListener;
import javax.swing.event.ChangeEvent;
import javax.swing.event.DocumentEvent;
import javax.swing.event.DocumentListener;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellEditor;

class RemaspTableModel extends AbstractTableModel {
  
  private String[] columnNames = {"Nr", "Inhalt"};
  
  private Object[][] data = {
                {"Akkumulator",  Long.valueOf(0)},
                {"1",  Long.valueOf(0)},
                {"2",  Long.valueOf(0)},
                {"3",  Long.valueOf(0)},
                {"4",  Long.valueOf(0)},
                {"5",  Long.valueOf(0)},
                {"6",  Long.valueOf(0)},
                {"7",  Long.valueOf(0)},
                {"8",  Long.valueOf(0)},
                {"9",  Long.valueOf(0)},
                {"10",  Long.valueOf(0)},
                {"11",  Long.valueOf(0)},
                {"12",  Long.valueOf(0)},
                {"13",  Long.valueOf(0)},
                {"14",  Long.valueOf(0)},
                {"15",  Long.valueOf(0)},
                {"16",  Long.valueOf(0)},
                {"17",  Long.valueOf(0)},
                {"18",  Long.valueOf(0)},
                {"19",  Long.valueOf(0)},
                {"20",  Long.valueOf(0)},
                {"21",  Long.valueOf(0)},
                {"22",  Long.valueOf(0)},
                {"23",  Long.valueOf(0)},
                {"24",  Long.valueOf(0)},
                {"25",  Long.valueOf(0)},
                {"26",  Long.valueOf(0)},
                {"27",  Long.valueOf(0)},
                {"28",  Long.valueOf(0)},
                {"29",  Long.valueOf(0)},
                {"30",  Long.valueOf(0)},
                {"31",  Long.valueOf(0)},
                {"32",  Long.valueOf(0)},
                {"33",  Long.valueOf(0)},
                {"34",  Long.valueOf(0)},
                {"35",  Long.valueOf(0)},
                {"36",  Long.valueOf(0)},
                {"37",  Long.valueOf(0)},
                {"38",  Long.valueOf(0)},
                {"39",  Long.valueOf(0)},
                {"40",  Long.valueOf(0)},
                {"41",  Long.valueOf(0)},
                {"42",  Long.valueOf(0)},
                {"43",  Long.valueOf(0)},
                {"44",  Long.valueOf(0)},
                {"45",  Long.valueOf(0)},
                {"46",  Long.valueOf(0)},
                {"47",  Long.valueOf(0)},
                {"48",  Long.valueOf(0)},
                {"49",  Long.valueOf(0)},
                {"50",  Long.valueOf(0)},
                {"51",  Long.valueOf(0)},
                {"52",  Long.valueOf(0)},
                {"53",  Long.valueOf(0)},
                {"54",  Long.valueOf(0)},
                {"55",  Long.valueOf(0)},
                {"56",  Long.valueOf(0)},
                {"57",  Long.valueOf(0)},
                {"58",  Long.valueOf(0)},
                {"59",  Long.valueOf(0)},
                {"60",  Long.valueOf(0)},
                {"61",  Long.valueOf(0)},
                {"62",  Long.valueOf(0)},
                {"63",  Long.valueOf(0)},
                {"64",  Long.valueOf(0)},
                {"65",  Long.valueOf(0)},
                {"66",  Long.valueOf(0)},
                {"67",  Long.valueOf(0)},
                {"68",  Long.valueOf(0)},
                {"69",  Long.valueOf(0)},
                {"70",  Long.valueOf(0)},
                {"71",  Long.valueOf(0)},
                {"72",  Long.valueOf(0)},
                {"73",  Long.valueOf(0)},
                {"74",  Long.valueOf(0)},
                {"75",  Long.valueOf(0)},
                {"76",  Long.valueOf(0)},
                {"77",  Long.valueOf(0)},
                {"78",  Long.valueOf(0)},
                {"79",  Long.valueOf(0)},
                {"80",  Long.valueOf(0)},
                {"81",  Long.valueOf(0)},
                {"82",  Long.valueOf(0)},
                {"83",  Long.valueOf(0)},
                {"84",  Long.valueOf(0)},
                {"85",  Long.valueOf(0)},
                {"86",  Long.valueOf(0)},
                {"87",  Long.valueOf(0)},
                {"88",  Long.valueOf(0)},
                {"89",  Long.valueOf(0)},
                {"90",  Long.valueOf(0)},
                {"91",  Long.valueOf(0)},
                {"92",  Long.valueOf(0)},
                {"93",  Long.valueOf(0)},
                {"94",  Long.valueOf(0)},
                {"95",  Long.valueOf(0)},
                {"96",  Long.valueOf(0)},
                {"97",  Long.valueOf(0)},
                {"98",  Long.valueOf(0)},
                {"99",  Long.valueOf(0)},
                {"100",  Long.valueOf(0)}
            };

  Class[] types = new Class [] {
                java.lang.String.class, java.lang.Long.class
            };
      
  boolean[] canEdit = new boolean [] {
                false, true
            };

  public Class getColumnClass(int columnIndex) {
    return types [columnIndex];
  }

  public boolean isCellEditable(int rowIndex, int columnIndex) {
    return canEdit [columnIndex];
  }
  
  public int getColumnCount() {
    return columnNames.length;
  }
  
  public String getColumnName(int col) {
    return columnNames[col];
  }  
  
  public int getRowCount() {
    return data.length;
  }          
  
  public Object getValueAt(int row, int col) {
    return data[row][col];
  }  
      
  public void setValueAt(Object value, int row, int col) {
    if (col == 1 && (value instanceof String)) {
      data[row][col] = Long.decode((String)value);
    } else {
      data[row][col] = value;
    }
    fireTableCellUpdated(row, col);
  }      
      
}
  

