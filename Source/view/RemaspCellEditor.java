/*
Copyright (c) 2017, Norman Sutatyo
All rights reserved.

This source code is licensed under the BSD-style license found in the
LICENSE file in the root directory of this source tree. 
 */
 
package remasp.view;

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


//Der Editor selbst ist ein einfaches JTextField
public class RemaspCellEditor extends JTextField implements TableCellEditor, DocumentListener{
  private List<CellEditorListener> listeners = new ArrayList<CellEditorListener>();
    
  public RemaspCellEditor() {
    // Der Editor hört sich selbst ab, so kann er auf jede Benutzereingabe reagieren
    getDocument().addDocumentListener( this );
    setFont(new java.awt.Font("Consolas", 0, 18));
  }

  public Component getTableCellEditorComponent( JTable table, Object value, boolean isSelected, int row, int column ) {
    // Diese Methode wird von der JTable aufgerufen, wenn der Editor angezeigt werden soll
    //setText( value.toString() );
    setText("");
    return this;
  }

  public void addCellEditorListener( CellEditorListener l ) {
    listeners.add( l );
  }

  public void cancelCellEditing() {
    // Falls abgebrochen wird, werden alle Listeners informiert
    ChangeEvent event = new ChangeEvent( this );
    for( CellEditorListener listener : listeners.toArray( new CellEditorListener[ listeners.size() ] ))
      listener.editingCanceled( event );
  }

  public Object getCellEditorValue() {
    // Gibt den aktuellen Wert des Editors zurück
    return getText();
  }

  public boolean isCellEditable( EventObject anEvent ) {
    // Im Falle eines MouseEvents, muss ein Doppelklick erfolgen, um den Editor zu aktivieren.
    // Ansonsten wird der Editor auf jeden Fall aktiviert
    if( anEvent instanceof MouseEvent )
      return ((MouseEvent)anEvent).getClickCount() > 1;
    
    return true;
  }

  public void removeCellEditorListener( CellEditorListener l ) {
    listeners.remove( l );
  }

  public boolean shouldSelectCell( EventObject anEvent ) {
    return true;
  }

  public boolean stopCellEditing() {
    // Sollte die Eingabe falsch sein, darf das Editieren nich gestoppt werden
    if( !isValidText() )
      return false;
    
    // Ansonsten werden die Listener vom stop unterrichtet
    ChangeEvent event = new ChangeEvent( this );
    for( CellEditorListener listener : listeners.toArray( new CellEditorListener[ listeners.size() ] ))
      listener.editingStopped( event );
    
    return true;
  }

  public void changedUpdate( DocumentEvent e ) {
    update();
  }

  public void insertUpdate( DocumentEvent e ) {
    update();
  }

  public void removeUpdate( DocumentEvent e ) {
    update();
  }
    
  private boolean isValidText(){
    // Bestimmt, was eine gültige Eingabe ist.
    return getText().matches( "[0-9]+" );
  }
    
  public void update(){
    // Verändert die Umrandung des Editors, je nachdem, ob eine gültige
    // oder eine ungültige Eingabe gemacht wurde
    Color color;
    if( isValidText() )
      color = Color.GREEN;
    else
      color = Color.RED;
    
    setBorder( BorderFactory.createLineBorder( color ));
  }
}


