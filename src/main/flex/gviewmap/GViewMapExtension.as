/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 10:18 PM
 * To change this template use File | Settings | File Templates.
 */
package gviewmap
{
import by.rovar.view.GViewStage;

import gviewmap.api.IGViewMap;
import gviewmap.impl.GViewMap;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.bender.framework.impl.UID;

public class GViewMapExtension implements IExtension
{
    [Inject]
    public var mediatorMap:IMediatorMap;

    private var _uid:String = UID.create(GViewMapExtension);
    private var _context:IContext;

    public function extend(context:IContext):void
    {
        _context = context;
        _context.injector.map(GViewStage).toSingleton(GViewStage);
        _context.injector.map(IGViewMap).toSingleton(GViewMap);
        _context.injector.getInstance(IGViewMap); //force IGViewMap creation
    }
}
}
