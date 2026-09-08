package haxe.ui.macros.extensions;

#if macro
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.ui.macros.MacroHelpers;
#end

class DataReorderableBuilder {
    #if macro

    macro static function build():Array<Field> {
        var fields = Context.getBuildFields();

        if (!MacroHelpers.shouldBuildExtension(Context.getLocalClass().get(), "haxe.ui.extensions.IDataReorderable")) {
            return null;
        }

        var dataReorderable = macro class Temp {
            /**
            * Utility property to add a single `ReorderEvent.REORDER_START` event
            */
            @:event(haxe.ui.events.ReorderEvent.REORDER_START)       public var onReorderStart:haxe.ui.events.ReorderEvent->Void;

            /**
            * Utility property to add a single `ReorderEvent.REORDER` event
            */
            @:event(haxe.ui.events.ReorderEvent.REORDER)             public var onReorder:haxe.ui.events.ReorderEvent->Void;

            /**
            * Utility property to add a single `ReorderEvent.REORDER_END` event
            */
            @:event(haxe.ui.events.ReorderEvent.REORDER_END)         public var onReorderEnd:haxe.ui.events.ReorderEvent->Void;

            private var _dataReorderable:Bool = false;

            /**
            * When set to `true`, this data inside of the component should be drag&drop-able.
            */
            public var dataReorderable(get, set):Bool;
            private function get_dataReorderable():Bool {
                return _dataReorderable;
            }
            private function set_dataReorderable(value:Bool):Bool {
                if (_dataReorderable == value) {
                    return value;
                }
                _dataReorderable = value;
                return value;
            }
        }

        return fields.concat(dataReorderable.get().fields);
    }

    #end
}