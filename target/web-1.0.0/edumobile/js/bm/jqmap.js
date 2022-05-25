(function(global, $) {

    /**
     * �̹��� �����ε�.
     * @constructor
     * @requires {Class} jQuery
     * @param {DomElement} obj - DOM Image Element
     * @param {Function} cbf - �ݹ��Լ�
     * @returns {*}
     */
    function ImagePreload(obj, cbf)
    {
        if(!(this instanceof ImagePreload)) {
            return new ImagePreload(obj, cbf);
        }

        var that = this;
        this.image = $(obj);
        this.checkload = function(image)
        {
            if(cbf) cbf();
        };

        this.image.one('load',function() { that.checkload(this); }).each(function() {if(this.complete) $(this).trigger('load');});
    }

    /**
     * �̹����� ���� ����� ���ϴ� �Լ�.
     * @requires {Class} ImagePreload
     * @param {DOMElement} obj - DOM Image Element
     * @param {Function} cbf - �ݹ��Լ�
     * @returns {*}
     */
    function imageOriginalSize(obj, cbf)
    {

        var target = obj,
            tempImage = new Image();

        tempImage.src = target.src;
        tempImage.style.position = 'absolute';
        tempImage.style.left = '-9999px';
        tempImage.style.visibility = 'hidden';
        tempImage.style.width = 'auto';
        tempImage.style.height = 'auto';

        document.body.appendChild(tempImage);

        new ImagePreload(tempImage, function() {

            target.setAttribute('orgwidth', tempImage.offsetWidth);
            target.setAttribute('orgheight', tempImage.offsetHeight);

            document.body.removeChild(tempImage);
            if(cbf) cbf();
        });
    }

    /**
     * Window â�� ���� Map ��ǥ ����.
     * @requires {Class} jQuery
     * @requires {Class} ImagePreload
     * @requires {Function} imageOriginalSize
     * @param {string} mapSelector  - ������ ������ ����. (#id, .class, etc)
     * @returns {*}
     */
    function mapResizable( mapSelector ) {

        function resize() {

            var $map = $(this),
                $area = $map.find('area'),
                $image = $('[usemap="#' + $map.attr('name') + '"]'),
                ratio = $image.width() / $map.data('ORIGIN_WIDTH');

            for(var k = 0, z = $area.length; k<z; k++) {
                var coords = $area.eq(k).attr("coords").split(', ');

                for(var i=0; i<coords.length; i++) {
                    var nums = coords[i].split(',');

                    for(var j=0; j<nums.length; j++) {
                        nums[j] = parseFloat(nums[j] * ratio).toFixed(2);
                    }

                    coords[i] = nums.join(',');
                }
                $area.eq(k).attr("coords", coords.join(","));
            }

            $map.data('ORIGIN_WIDTH', $image.width());
        }

        function revertMatrix() {
            var $map = $(this),
                $area = $map.find('area');

            for(var i = 0, j = $area.length; i<j; i++) {
                $area.eq(i).attr('coords', $area.eq(i).data('ORIGIN_MATRIX') )
            }
        }

        function initialize() {

            var $map = $(this),
                $area = $map.find('area'),
                $image = $('[usemap="#' + $map.attr('name') + '"]'),
                ev = $._data(this, 'events');

            if(ev && ev.revertMatrix) {
                console.error('�� �޼����� Selector �� ��ø �Ǿ��� ���� �߻� �մϴ�. �ߺ� ȣ�� �Ǵ� Selector�� �ִ��� Ȯ���� �ʿ��մϴ�.', this);
                return;
            }

            $map.on('setResize', resize);
            $map.on('revertMatrix', revertMatrix);

            for(var i = 0, j = $image.length; i < j; i++) {
                imageOriginalSize($image.eq(0).get(0), function() {
                    $map.data({
                        'ORIGIN_WIDTH' : parseInt($image.attr('orgwidth'),10)
                    }).trigger('setResize');
                });
            }

            for(var k = 0, z = $area.length; k < z; k++) {
                $area.eq(k).data({
                    'ORIGIN_MATRIX' : $area.eq(k).attr('coords')
                });
            }

            $(window).on('resize.mapResizable', function() { $map.trigger('setResize'); });
        }

        return this.each(initialize);
    }

    $.fn.mapResizable = mapResizable;

})(this, jQuery);