/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 10:25 PM
 * To change this template use File | Settings | File Templates.
 */
package gviewmap.api
{
import flash.events.Event;
import flash.events.IEventDispatcher;


import robotlegs.bender.extensions.localEventMap.api.IEventMap;

import robotlegs.bender.extensions.mediatorMap.api.IMediator;

public class GViewMediator implements IMediator
{
    [Inject]
    public var eventMap:IEventMap;

    [Inject]
    public var eventDispatcher:IEventDispatcher;

    private var _viewComponent:Object;

    public function set viewComponent(view:Object):void
    {
        _viewComponent = view;
    }

    public function get viewComponent():Object
    {
        return _viewComponent;
    }

    public function initialize():void
    {
    }

    public function destroy():void
    {
    }
    
    public function postDestroy():void
    {
    }

    protected function addContextListener(eventString:String, listener:Function, eventClass:Class = null):void
    {
        eventMap.mapListener(eventDispatcher, eventString, listener, eventClass);
    }

    protected function removeContextListener(eventString:String, listener:Function, eventClass:Class = null):void
    {
        eventMap.unmapListener(eventDispatcher, eventString, listener, eventClass);
    }

    protected function addViewListener(eventString:String, listener:Function, eventClass:Class = null):void
    {
        eventMap.mapListener(_viewComponent as IEventDispatcher, eventString, listener, eventClass);
    }

    protected function removeViewListener(eventString:String, listener:Function, eventClass:Class = null):void
    {
        eventMap.unmapListener(_viewComponent as IEventDispatcher, eventString, listener, eventClass);
    }

    protected function dispatch(event:Event):void
    {
        if (eventDispatcher.hasEventListener(event.type))
        {
            eventDispatcher.dispatchEvent(event);
        }
    }
}
}
