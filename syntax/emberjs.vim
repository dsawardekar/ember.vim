" keywords
syn keyword emberNamespace App Ember Em DS

" emberjs classes
syn keyword emberClass ControllerMixin Application DefaultResolver Ember Handlebars Compiler JavaScriptCompiler Checkbox Select
syn keyword emberClass TextArea TextField TextSupport HandlebarsBoundView Metamorph MetamorphView SimpleMetamorphView String
syn keyword emberClass Binding ComputedProperty Logger Instrumentation OrderedSet Map MapWithDefault Mixin platform Descriptor
syn keyword emberClass LinkView Location HashLocation HistoryLocation NoneLocation Route Router ReduceComputedProperty ArrayController
syn keyword emberClass Controller ObjectController RSVP Function ActionHandler Array Comparable Copyable Deferred Enumerable Evented
syn keyword emberClass Freezable MutableArray MutableEnumerable Observable PromiseProxyMixin SortableMixin TargetActionSupport ArrayProxy
syn keyword emberClass CoreObject EachProxy Namespace NativeArray Object ObjectProxy Set SubArray TrackedArray Error Adapter QUnitAdapter
syn keyword emberClass Test ViewTargetActionSupport EventDispatcher RenderBuffer CollectionView Component ContainerView CoreView View StateManager State

" emberjs functions
" TODO
syn keyword emberMethod create extend map setupController beforeModel afterModel model renderTemplate

" ember data classes
syn keyword emberDataClass FixtureAdapter RESTAdapter Date AttributeChange RelationshipChange RelationshipChangeAdd RelationshipChangeRemove Mappable Model AdapterPopulatedRecordArray FilteredRecordArray ManyArray RecordArray Adapter RecordArrayManager Store

" ember data methods
syn keyword emberDataMethod find findMany findAll findQuery createRecord updateRecord

" user classes
syn match emberUserClass '\v\i+(Route|Controller|View|Component)'


" highlighting
hi def link emberNamespace Define
hi def link emberClass Type
hi def link emberMethod Function
hi def link emberDataClass Define
hi def link emberDataMethod Function
hi def link emberUserClass Identifier

" default styles
if !exists('emberjs_no_default_styles')
end
