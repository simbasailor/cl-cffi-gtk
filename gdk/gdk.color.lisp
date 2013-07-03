;;; ----------------------------------------------------------------------------
;;; gdk.color.lisp
;;;
;;; This file contains code from a fork of cl-gtk2.
;;; See <http://common-lisp.net/project/cl-gtk2/>.
;;;
;;; The documentation has been copied from the GDK 3 Reference Manual
;;; Version 3.6.4. See <http://www.gtk.org>. The API documentation of the
;;; Lisp binding is available at <http://www.crategus.com/books/cl-cffi-gtk/>.
;;;
;;; Copyright (C) 2009 - 2011 Kalyanov Dmitry
;;; Copyright (C) 2011 - 2013 Dieter Kaiser
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
;;;
;;; Colors
;;;
;;; Manipulation of colors
;;;
;;; Synopsis
;;;
;;;     GdkColor
;;;
;;;     gdk_color_copy
;;;     gdk_color_free
;;;     gdk_color_parse
;;;     gdk_color_equal
;;;     gdk_color_hash
;;;     gdk_color_to_string
;;;
;;; Description
;;;
;;; A GdkColor represents a color.
;;;
;;; When working with cairo, it is often more convenient to use a GdkRGBA
;;; instead.
;;; ----------------------------------------------------------------------------

(in-package :gdk)

;;; ----------------------------------------------------------------------------
;;; GdkColor
;;; ----------------------------------------------------------------------------

(define-g-boxed-cstruct gdk-color "GdkColor"
  (pixel :uint32 :initform 0)
  (red :uint16 :initform 0)
  (green :uint16 :initform 0)
  (blue :uint16 :initform 0))

#+cl-cffi-gtk-documentation
(setf (documentation 'gdk-color 'type)
 "@version{2013-6-4}
  @short{A @sym{gdk-color} represents a color.}

  The @sym{gdk-color} structure is used to describe a color, similar to the
  XColor structure used in the X11 drawing API.
  When working with cairo, it is often more convenient to use a @class{gdk-rgba}
  instead.
  @begin{pre}
(define-g-boxed-cstruct gdk-color \"GdkColor\"
  (pixel :uint32 :initform 0)
  (red :uint16 :initform 0)
  (green :uint16 :initform 0)
  (blue :uint16 :initform 0))
  @end{pre}
  @begin[code]{table}
    @entry[pixel]{For allocated colors, the pixel value used to draw this
      color on the screen. Not used anymore.}
    @entry[red]{The red component of the color. This is a value between
      @code{0} and @code{65535}, with @code{65535} indicating full intensity.}
    @entry[green]{The green component of the color.}
    @entry[blue]{The blue component of the color.}
  @end{table}
  @see-constructor{make-gdk-color}
  @see-constructor{copy-gdk-color}
  @see-slot{gdk-color-pixel}
  @see-slot{gdk-color-red}
  @see-slot{gdk-color-green}
  @see-slot{gdk-color-blue}")

(export (boxed-related-symbols 'gdk-color))

;;; --- copy-gdk-color ---------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation 'copy-gdk-color 'function)
 "@version{2013-6-15}
  @argument[instance]{a @class{gdk-color} structure}
  Copy constructor of a @class{gdk-color} structure.")

;;; --- make-gdk-color ---------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (documentation 'make-gdk-color 'function)
 "@version{2013-6-15}
  @argument[pixel]{For allocated colors, the pixel value used to draw this
      color on the screen. Not used anymore.}
  @argument[red]{The red component of the color. This is a value between
      @code{0} and @code{65535}, with @code{65535} indicating full intensity.}
  @argument[green]{The green component of the color.}
  @argument[blue]{The blue component of the color.}
  Creates a @class{gdk-color} structure.")

;;; --- gdk-color-pixel --------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gdk-color-pixel atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gdk-color-pixel 'function)
 "@version{2013-2-2}
  @begin{short}
    Accessor of the slot \"pixel\" of the @class{gdk-color} struct.
  @end{short}")

;;; --- gdk-color-red --------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gdk-color-red atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gdk-color-red 'function)
 "@version{2013-2-2}
  @begin{short}
    Accessor of the slot \"redl\" of the @class{gdk-color} struct.
  @end{short}")

;;; --- gdk-color-green --------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gdk-color-green atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gdk-color-green 'function)
 "@version{2013-2-2}
  @begin{short}
    Accessor of the slot \"green\" of the @class{gdk-color} struct.
  @end{short}")

;;; --- gdk-color-blue ---------------------------------------------------------

#+cl-cffi-gtk-documentation
(setf (gethash 'gdk-color-blue atdoc:*function-name-alias*)
      "Accessor"
      (documentation 'gdk-color-blue 'function)
 "@version{2013-2-2}
  @begin{short}
    Accessor of the slot \"blue\" of the @class{gdk-color} struct.
  @end{short}")

;;; ----------------------------------------------------------------------------
;;; gdk_color_copy ()
;;; ----------------------------------------------------------------------------

(declaim (inline gdk-color-copy))

(defun gdk-color-copy (color)
 #+cl-cffi-gtk-documentation
 "@version{2013-2-2}
  @argument[color]{a @class{gdk-color} struct}
  @return{a copy of @arg{color}}
  @begin{short}
    Makes a copy of a color structure.
  @end{short}"
  (copy-gdk-color color))

(export 'gdk-color-copy)

;;; ----------------------------------------------------------------------------
;;; gdk_color_free ()
;;;
;;; void gdk_color_free (GdkColor *color);
;;;
;;; Frees a color structure created with gdk_color_copy().
;;;
;;; color :
;;;     a GdkColor
;;; ----------------------------------------------------------------------------

;; not needed

;;; ----------------------------------------------------------------------------
;;; gdk_color_parse ()
;;; ----------------------------------------------------------------------------

(defcfun ("gdk_color_parse" %gdk-color-parse) :boolean
  (spec :string)
  (color (g-boxed-foreign gdk-color)))

(defun gdk-color-parse (color-spec)
 #+cl-cffi-gtk-documentation
 "@version{2013-2-2}
  @argument[spec]{the string specifying the color}
  @return{The @class{gdk-color} color or @code{nil} if the parsing did not
    succeed.}
  @begin{short}
    Parses a textual specification of a color and fill in the red, green, and
    blue fields of a @class{gdk-color} structure.
  @end{short}

  The string can either one of a large set of standard names (taken from the
  X11 rgb.txt file), or it can be a hex value in the form '#rgb' '#rrggbb'
  '#rrrgggbbb' or '#rrrrggggbbbb' where 'r', 'g' and 'b' are hex digits of the
  red, green, and blue components of the color, respectively. (White in the
  four forms is '#fff', '#ffffff', '#fffffffff' and '#ffffffffffff')."
  (let ((color (make-gdk-color)))
    (when (%gdk-color-parse color-spec color)
      color)))

(export 'gdk-color-parse)

;;; ----------------------------------------------------------------------------
;;; gdk_color_equal ()
;;; ----------------------------------------------------------------------------

(defcfun ("gdk_color_equal" gdk-color-equal) :boolean
 #+cl-cffi-gtk-documentation
 "@version{2013-2-2}
  @argument[color1]{a @class{gdk-color}}
  @argument[color2]{another @class{gdk-color}}
  @return{@arg{true} if the two colors compare equal}
  @begin{short}
    Compares two colors.
  @end{short}"
  (color1 (g-boxed-foreign gdk-color))
  (color2 (g-boxed-foreign gdk-color)))

(export 'gdk-color-equal)

;;; ----------------------------------------------------------------------------
;;; gdk_color_hash ()
;;; ----------------------------------------------------------------------------

(defcfun ("gdk_color_hash" gdk-color-hash) :uint
 #+cl-cffi-gtk-documentation
 "@version{2013-2-2}
  @argument[color]{a @class{gdk-color}}
  @return{The hash function applied to color.}
  @begin{short}
    A hash function suitable for using for a hash table that stores
    @class{gdk-color}'s.
  @end{short}"
  (color (g-boxed-foreign gdk-color)))

(export 'gdk-color-hash)

;;; ----------------------------------------------------------------------------
;;; gdk_color_to_string ()
;;; ----------------------------------------------------------------------------

(defcfun ("gdk_color_to_string" gdk-color-to-string)
    (g-string :free-from-foreign t)
 #+cl-cffi-gtk-documentation
 "@version{2013-2-2}
  @argument[color]{a @class{gdk-color}}
  @return{A newly-allocated text string.}
  @begin{short}
    Returns a textual specification of color in the hexadecimal form
    #rrrrggggbbbb, where r, g and b are hex digits representing the red, green
    and blue components respectively.
  @end{short}

  The returned string can be parsed by @fun{gdk-color-parse}.

  Since 2.12"
  (color (g-boxed-foreign gdk-color)))

(export 'gdk-color-to-string)

;;; --- End of file gdk.color.lisp ---------------------------------------------
