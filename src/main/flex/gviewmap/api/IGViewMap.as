/**
 * Created with IntelliJ IDEA.
 * User: vaukalak
 * Date: 6/30/13
 * Time: 10:55 PM
 * To change this template use File | Settings | File Templates.
 */
package gviewmap.api
{
import by.rovar.view.GView;

public interface IGViewMap
{
    function addGView(view:GView):void;
    function removeGView(view:GView):void;
}
}
