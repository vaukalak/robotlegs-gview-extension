/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 10:54 PM
 * To change this template use File | Settings | File Templates.
 */
package gviewmap.impl
{
import by.rovar.events.GViewEvent;
import by.rovar.view.GView;
import by.rovar.view.GViewStage;

import gviewmap.api.IGViewMap;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

public class GViewMap implements IGViewMap
{

    [Inject]
    public var gViewStage:GViewStage;

    [Inject]
    public var mediatorMap:IMediatorMap;

    [PostConstruct]
    public function init():void
    {
        gViewStage.addEventListener(GViewEvent.ADDED, onGViewAdded);
        gViewStage.addEventListener(GViewEvent.REMOVED, onGViewRemoved);
    }



    public function addGView(view:GView):void
    {
        mediatorMap.mediate(view);
    }

    public function removeGView(view:GView):void
    {
        mediatorMap.unmediate(view);
    }

    //---------------------------------
    //
    //  PRIVATE METHODS
    //
    //---------------------------------

    private function onGViewRemoved(event:GViewEvent):void
    {
        removeGView(event.target as GView);
    }


    private function onGViewAdded(event:GViewEvent):void
    {
        addGView(event.target as GView);
    }
}
}
