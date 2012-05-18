;;; ----------------------------------------------------------------------------
;;; gtk.fixed.lisp
;;; 
;;; This file contains code from a fork of cl-gtk2.
;;; See http://common-lisp.net/project/cl-gtk2/
;;; 
;;; The documentation has been copied from the GTK+ 3 Reference Manual
;;; Version 3.4.3. See http://www.gtk.org.
;;; 
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2012 Dieter Kaiser
;;; 
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU Lesser General Public License for Lisp
;;; as published by the Free Software Foundation, either version 3 of the
;;; License, or (at your option) any later version and with a preamble to
;;; the GNU Lesser General Public License that clarifies the terms for use
;;; with Lisp programs and is referred as the LLGPL.
;;; 
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU Lesser General Public License for more details.
;;; 
;;; You should have received a copy of the GNU Lesser General Public
;;; License along with this program and the preamble to the Gnu Lesser
;;; General Public License.  If not, see <http://www.gnu.org/licenses/>
;;; and <http://opensource.franz.com/preamble.html>.
;;; ----------------------------------------------------------------------------
;;;﻿
;;; GtkFixed
;;;
;;; A container which allows you to position widgets at fixed coordinates
;;;
;;; Synopsis
;;;
;;;     GtkFixed
;;;
;;;     gtk_fixed_new
;;;     gtk_fixed_put
;;;     gtk_fixed_move
;;;
;;; Object Hierarchy
;;;
;;;   GObject
;;;    +----GInitiallyUnowned
;;;          +----GtkWidget
;;;                +----GtkContainer
;;;                      +----GtkFixed
;;;
;;; Implemented Interfaces
;;;
;;; GtkFixed implements AtkImplementorIface and GtkBuildable.
;;;
;;; Child Properties
;;;
;;;   "x"                        gint                  : Read / Write
;;;   "y"                        gint                  : Read / Write
;;;
;;; Description
;;;
;;; The GtkFixed widget is a container which can place child widgets at fixed
;;; positions and with fixed sizes, given in pixels. GtkFixed performs no
;;; automatic layout management.
;;;
;;; For most applications, you should not use this container! It keeps you from
;;; having to learn about the other GTK+ containers, but it results in broken
;;; applications. With GtkFixed, the following things will result in truncated
;;; text, overlapping widgets, and other display bugs:
;;;
;;;   * Themes, which may change widget sizes.
;;;
;;;   * Fonts other than the one you used to write the app will of course
;;;     change the size of widgets containing text; keep in mind that users may
;;;     use a larger font because of difficulty reading the default, or they
;;;     may be using Windows or the framebuffer port of GTK+, where different
;;;     fonts are available.
;;;
;;;   * Translation of text into other languages changes its size. Also,
;;;     display of non-English text will use a different font in many cases.
;;;
;;; In addition, the fixed widget can't properly be mirrored in right-to-left
;;; languages such as Hebrew and Arabic. i.e. normally GTK+ will flip the
;;; interface to put labels to the right of the thing they label, but it can't
;;; do that with GtkFixed. So your application will not be usable in
;;; right-to-left languages.
;;;
;;; Finally, fixed positioning makes it kind of annoying to add/remove GUI
;;; elements, since you have to reposition all the other elements. This is a
;;; long-term maintenance problem for your application.
;;;
;;; If you know none of these things are an issue for your application, and
;;; prefer the simplicity of GtkFixed, by all means use the widget. But you
;;; should be aware of the tradeoffs.
;;;
;;; ----------------------------------------------------------------------------
;;;
;;; Child Property Details
;;;
;;; ----------------------------------------------------------------------------
;;; The "x" child property
;;;
;;;   "x"                        gint                  : Read / Write
;;;
;;; X position of child widget.
;;;
;;; Default value: 0
;;;
;;; ----------------------------------------------------------------------------
;;; The "y" child property
;;;
;;;   "y"                        gint                  : Read / Write
;;;
;;; Y position of child widget.
;;;
;;; Default value: 0
;;; ----------------------------------------------------------------------------

(in-package :gtk)

;;; ----------------------------------------------------------------------------
;;; struct GtkFixed
;;;
;;; struct GtkFixed;
;;; ----------------------------------------------------------------------------

(eval-when (:compile-toplevel :load-toplevel :execute)
  (register-object-type "GtkFixed" 'gtk-fixed))

(define-g-object-class "GtkFixed" gtk-fixed
  (:superclass gtk-container
   :export t
   :interfaces ("AtkImplementorIface"
                "GtkBuildable")
   :type-initializer "gtk_fixed_get_type")
  nil)

;;; ----------------------------------------------------------------------------

(define-child-property "GtkFixed"
                       gtk-fixed-child-x
                       "x" "gint" t t t)

(define-child-property "GtkFixed"
                       gtk-fixed-child-y
                       "y" "gint" t t t)

;;; ----------------------------------------------------------------------------
;;; gtk_fixed_new ()
;;;
;;; GtkWidget * gtk_fixed_new (void);
;;;
;;; Creates a new GtkFixed.
;;;
;;; Returns :
;;;     a new GtkFixed.
;;; ----------------------------------------------------------------------------

(declaim (inline gtk-fixed-new))

(defun gtk-fixed-new ()
  (make-instance 'gtk-fixed))

(export 'gtk-fixed-new)

;;; ----------------------------------------------------------------------------
;;; gtk_fixed_put ()
;;;
;;; void gtk_fixed_put (GtkFixed *fixed, GtkWidget *widget, gint x, gint y);
;;;
;;; Adds a widget to a GtkFixed container at the given position.
;;;
;;; fixed :
;;;     a GtkFixed.
;;;
;;; widget :
;;;     the widget to add.
;;;
;;; x :
;;;     the horizontal position to place the widget at.
;;;
;;; y :
;;;     the vertical position to place the widget at.
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_fixed_put" gtk-fixed-put) :void
  (fixed g-object)
  (widget g-object)
  (x :int)
  (y :int))

(export 'gtk-fixed-put)

;;; ----------------------------------------------------------------------------
;;; gtk_fixed_move ()
;;;
;;; void gtk_fixed_move (GtkFixed *fixed, GtkWidget *widget, gint x, gint y);
;;;
;;; Moves a child of a GtkFixed container to the given position.
;;;
;;; fixed :
;;;     a GtkFixed.
;;;
;;; widget :
;;;     the child widget.
;;;
;;; x :
;;;     the horizontal position to move the widget to.
;;;
;;; y :
;;;     the vertical position to move the widget to.
;;; ----------------------------------------------------------------------------

(defcfun ("gtk_fixed_move" gtk-fixed-move) :void
  (fixed (g-object gtk-fixed))
  (widget g-object)
  (x :int)
  (y :int))

(export 'gtk-fixed-move)

;;; --- End of file gtk.fixed.lisp ---------------------------------------------
